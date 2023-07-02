import 'dart:async';

import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:abc_fun/core/domain/action_items_repository.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:abc_fun/core/providers/providers.dart';
import 'package:abc_fun/core/utils/extensions/string_ext.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  ChallengeBloc({required this.actionItemsRepository}) : super(ChallengeLoadingState()) {
    on<ChallengeEvent>(handleEvent);
    _init();
  }
  static const int _maxImageSelection = 4;

  final ActionItemsRepository actionItemsRepository;
  Map<String, List<ActionCustomItemEntity>> _actions = {};

  FutureOr<void> handleEvent(ChallengeEvent event, Emitter<ChallengeState> emit) async {
    if (event is ChallengeLoadedEvent) {
      emit(ChallengeLoadedState(
        actionsGroupedByName: _actions,
      ));
    }
    if (event is ChallengeToggleActionEvent) {
      _toggle(event.actionName, emit);
    }

    if (event is CreateNewChallengeNewActionDataEvent) {
      _createNewChallengeData(event, emit);
    }
    if (event is CreateNewChallengeSaveEvent) {
      _saveNewChallenge(emit);
    }
    if (event is ChallengeInitialEvent) {
      _init();
    }
    if (event is CreateNewChallengeCompleteEvent) {
      emit(ChallengeNewActionSavedState());
    }
  }

  void _init() async {
    _actions = groupBy(
        List.castFrom<ActionItemEntity, ActionCustomItemEntity>(await actionItemsRepository.getAllItems()),
        (e) => e.name.toLowerCase());

    if (!isClosed) {
      add(const ChallengeLoadedEvent());
    }
  }

  void _toggle(String actionName, Emitter<ChallengeState> emit) async {
    for (var element in _actions[actionName]!) {
      element.isActive = !element.isActive;
    }
    if (_haveAtLeast2Active(actionName, emit)) {
      emit(ChallengeLoadedState(
        actionsGroupedByName: _actions,
      ));
      actionItemsRepository.addAllItems(_actions[actionName]!);
    }
  }

  bool _haveAtLeast2Active(String actionName, Emitter<ChallengeState> emit) {
    int totalActives = _actions.values.fold<int>(0, (previousValue, element) {
      if (element.first.isActive) {
        return previousValue + 1;
      }
      return previousValue;
    });

    if (totalActives < 2) {
      for (var element in _actions[actionName]!) {
        element.isActive = !element.isActive;
      }
      emit(ChallengeErrorState(
        actionsGroupedByName: _actions,
      ));
      return false;
    }
    return true;
  }

  void _createNewChallengeData(CreateNewChallengeNewActionDataEvent event, Emitter<ChallengeState> emit) {
    if (state is ChallengeNewActionDataState) {
      final state = this.state as ChallengeNewActionDataState;
      List<String> images = List.from([...state.imagePaths, ...event.imagePaths ?? []].take(4));

      emit(ChallengeNewActionDataState(
          imagePaths: images.take(_maxImageSelection).toList(),
          title: event.title ?? state.title,
          audioPath: event.audioPath ?? state.audioPath,
          errorNeedTitle: false));
      return;
    }
    emit(ChallengeNewActionDataState(
        imagePaths: event.imagePaths ?? [],
        title: event.title ?? '',
        audioPath: event.audioPath,
        errorNeedTitle: false));
  }

  Future<void> _saveNewChallenge(Emitter<ChallengeState> emit) async {
    if (state is ChallengeNewActionDataState) {
      final state = this.state as ChallengeNewActionDataState;
      if (state.title.isEmpty) {
        emit(ChallengeNewActionDataState(
            imagePaths: state.imagePaths,
            title: state.title.capitalize(),
            audioPath: state.audioPath,
            errorNeedTitle: true));
        return;
      }

      for (String imagePath in state.imagePaths) {
        await actionItemsRepository.addItem(ActionCustomItemEntity(
            name: state.title,
            isActive: true,
            group: ActionGroup.custom,
            dificulty: 2,
            imagePath: '',
            imageBytes: await provider.read(Providers.pathProviderHelper).getBytesFromFilePath(imagePath),
            audioBytes: state.audioPath != null
                ? await provider.read(Providers.pathProviderHelper).getBytesFromFilePath(state.audioPath!)
                : null,
            notAllowedWith: []));
      }
      if (isClosed) return;
      add(const CreateNewChallengeCompleteEvent());
    }
  }
}
