import 'dart:async';

import 'package:abc_fun/core/domain/action_items_repository.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required this.actionEntityRepository, required this.settingsRepository}) : super(GameLoading()) {
    on<GameEvent>(eventHandler);
    _startGameSetup();
  }
  final ActionItemsRepository actionEntityRepository;
  final SettingsRepository settingsRepository;
  int itemsCount = 6;
  int rounds = 2;
  int currentRound = 0;
  int totalMoves = 0;
  Uint8List? rewardImageBytes;
  double get finalScorePercentage => rounds / totalMoves * 100;

  final List<ActionItemEntity> roundItems = <ActionItemEntity>[];
  final List<ActionItemEntity> possibleItems = <ActionItemEntity>[];

  FutureOr<void> eventHandler(GameEvent event, Emitter<GameState> emit) async {
    switch (event.runtimeType) {
      case GameEventOnItemTapped:
        emit(_nextState(event as GameEventOnItemTapped));
        return;
      case GameRestartStageEvent:
        _phaseGenerator(emit);
        return;
      case GameWithErrorEvent:
        emit(GameError());
        return;
      case GamePlayAgainEvent:
        _startGameSetup();
        return;
    }
  }

  GameState _nextState(GameEventOnItemTapped event) {
    totalMoves++;
    if (state is GameRunning && event.item == (state as GameRunning).correctAnswer && currentRound < rounds) {
      return GameVictory(image: rewardImageBytes);
    }
    if (state is GameRunning && event.item != (state as GameRunning).correctAnswer && currentRound <= rounds) {
      return GameWrongAnswer.fromRunningState(state as GameRunning);
    }
    return GameOver(scorePercentage: finalScorePercentage);
  }

  void _phaseGenerator(Emitter<GameState> emit) {
    if (state is GameWrongAnswer) {
      emit(GameRunning.fromWrongAnswerState(state as GameWrongAnswer));
      return;
    }
    Set<String> containnedItems = <String>{roundItems[currentRound].name.toLowerCase()};
    possibleItems.shuffle();
    List<ActionItemEntity> phaseItems = <ActionItemEntity>[
      roundItems[currentRound],
      ...possibleItems.where((element) {
        return element.name.toLowerCase() != roundItems[currentRound].name.toLowerCase() &&
            containnedItems.add(element.name.toLowerCase());
      }).take(itemsCount - 1)
    ];
    emit(GameRunning(correctAnswer: roundItems[currentRound], items: phaseItems..shuffle()));
    currentRound++;
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
    roundItems.addAll(event
      ..shuffle()
      ..skipWhile(
        (value) => !containedItems.add(value.name.toLowerCase()),
      ).take(rounds));
    possibleItems.addAll(event);
    add(GameRestartStageEvent());
  }

  Future<void> _loadingSettings() async {
    SettingsEntity? settings = await settingsRepository.getSettings();
    if (settings == null) {
      add(GameWithErrorEvent());
      return;
    }
    rounds = settings.selectedStageQuantity;
    itemsCount = settings.selectedActionsPerStage;
    if (settings.rewardImageBytes != null) {
      rewardImageBytes = Uint8List.fromList(settings.rewardImageBytes!);
    }
  }
}
