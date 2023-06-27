import 'dart:async';

import 'package:aba/core/db/schemas/action_custom_item_entity.dart';
import 'package:aba/core/domain/action_items_repository.dart';
import 'package:aba/core/domain/models/action_item_entity.dart';
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
  }

  void _init() async {
    _actions = groupBy(
        List.castFrom<ActionItemEntity, ActionCustomItemEntity>(await actionItemsRepository.getAllItems()),
        (e) => e.name);

    // _activeActions = _actions.where((element) => element.isActive).map((e) => e.name).toSet();
    add(ChallengeLoadedEvent());
  }

  void _toggle(String actionName, Emitter<ChallengeState> emit) async {
    for (var element in _actions[actionName]!) {
      element.isActive = !element.isActive;
    }
    if (_haveMin2Active(actionName, emit)) {
      emit(ChallengeLoadedState(
        actionsGroupedByName: _actions,
      ));
      actionItemsRepository.addAllItems(_actions[actionName]!);
    }
  }

  bool _haveMin2Active(String actionName, Emitter<ChallengeState> emit) {
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
}
