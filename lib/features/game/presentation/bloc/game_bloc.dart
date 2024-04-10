import 'dart:async';
import 'dart:convert';

import 'package:abc_fun/core/db/schemas/game_session_dto.dart';
import 'package:abc_fun/core/domain/action_items_repository.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:abc_fun/features/game/domain/game_session_repository.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required this.actionEntityRepository,
    required this.settingsRepository,
    required this.gameSessionRepository,
  }) : super(GameLoading()) {
    on<GameEvent>(eventHandler);
    _startGameSetup();
  }
  final ActionItemsRepository actionEntityRepository;
  final SettingsRepository settingsRepository;
  final GameSessionRepository gameSessionRepository;

  int _itemsCount = 6;
  int _rounds = 2;
  int _currentRound = 0;
  int _totalMoves = 0;
  Uint8List? rewardImageBytes;
  final Map<String, GameSessionAction> _playedActions = <String, GameSessionAction>{};

  final List<ActionItemEntity> _roundItems = <ActionItemEntity>[];
  final List<ActionItemEntity> _possibleItems = <ActionItemEntity>[];

  FutureOr<void> eventHandler(GameEvent event, Emitter<GameState> emit) async {
    switch (event) {
      case GameEventOnItemTapped() :
        emit(_nextState(event));
        return;
      case GameRestartStageEvent() :
        _phaseGenerator(emit);
        return;
      case GameWithErrorEvent() :
        emit(GameError());
        return;
      case GamePlayAgainEvent() :
        _resetGame();
        return;
    }
  }

  GameState _nextState(GameEventOnItemTapped event) {
    _totalMoves++;
    if (state is GameRunning && event.item == (state as GameRunning).correctAnswer && _currentRound < _rounds) {
      _addToGameSession((state as GameRunning).correctAnswer);
      return GameVictory(image: rewardImageBytes);
    }
    if (state is GameRunning && event.item != (state as GameRunning).correctAnswer && _currentRound <= _rounds) {
      _addWrongAnswerToSession((state as GameRunning).correctAnswer);
      return GameWrongAnswer.fromRunningState(state as GameRunning);
    }
    _addToGameSession((state as GameRunning).correctAnswer);
    _saveSession();
    return GameOver();
  }

  void _phaseGenerator(Emitter<GameState> emit) {
    if (state is GameWrongAnswer) {
      emit(GameRunning.fromWrongAnswerState(state as GameWrongAnswer));
      return;
    }
    Set<String> containnedItems = <String>{_roundItems[_currentRound].name.toLowerCase()};
    _possibleItems.shuffle();
    List<ActionItemEntity> phaseItems = <ActionItemEntity>[
      _roundItems[_currentRound],
      ..._possibleItems.where((element) {
        return element.name.toLowerCase() != _roundItems[_currentRound].name.toLowerCase() &&
            containnedItems.add(element.name.toLowerCase());
      }).take(_itemsCount - 1)
    ];
    emit(GameRunning(correctAnswer: _roundItems[_currentRound], items: phaseItems..shuffle()));
    _currentRound++;
  }

  Future<void> _startGameSetup() async {
    await _loadingSettings();
    Set<String> containedItems = <String>{};
    List<ActionItemEntity> event = (await actionEntityRepository.getAllItems()).where((e) {
      return e.isActive;
    }).toList();
    if (event.isEmpty) {
      add(GameWithErrorEvent());
    }
    _roundItems.addAll(event
      ..shuffle()
      ..skipWhile(
        (value) => !containedItems.add(value.name.toLowerCase()),
      ).take(_rounds));
    _possibleItems.addAll(event);
    add(GameRestartStageEvent());
  }

  Future<void> _loadingSettings() async {
    SettingsEntity? settings = await settingsRepository.getSettings();
    if (settings == null) {
      add(GameWithErrorEvent());
      return;
    }
    _rounds = settings.selectedStageQuantity;
    _itemsCount = settings.selectedActionsPerStage;
    if (settings.rewardImageBytes != null) {
      rewardImageBytes = Uint8List.fromList(settings.rewardImageBytes!);
    }
  }

  void _addToGameSession(ActionItemEntity item) {
    if (_playedActions.containsKey(item.name)) {
      _playedActions[item.name]!.totalPlayed++;
    } else {
      _playedActions[item.name] = GameSessionAction(
        actionName: item.name,
        group: item.group,
      );
    }
  }

  void _addWrongAnswerToSession(ActionItemEntity item) {
    if (_playedActions.containsKey(item.name)) {
      _playedActions[item.name]!.totalWrong++;
      _playedActions[item.name]!.totalPlayed++;
    } else {
      _playedActions[item.name] = GameSessionAction(
        actionName: item.name,
        group: item.group,
        totalWrong: 1,
      );
    }
  }

  void _saveSession() {
    gameSessionRepository.insert(GameSessionDto(
        createdAt: DateTime.now().toUtc(),
        totalMoves: _totalMoves,
        totalWrongAnswers:
            _playedActions.values.fold<int>(0, (previousValue, element) => previousValue + element.totalWrong),
        totalStages: _rounds,
        totalActionsJson: jsonEncode(_playedActions.values.toList())));
  }

  void _resetGame() {
    _currentRound = 0;
    _totalMoves = 0;
    _playedActions.clear();
    _possibleItems.clear();
    _roundItems.clear();

    _startGameSetup();
  }
}
