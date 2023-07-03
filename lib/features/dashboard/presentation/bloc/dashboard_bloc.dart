import 'dart:async';

import 'package:abc_fun/core/db/schemas/game_session_dto.dart';
import 'package:abc_fun/features/game/domain/game_session_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required this.gameSessionRepository}) : super(DashboardLoadingState()) {
    on<DashboardEvent>(_handleEvent);
    _init();
  }

  final GameSessionRepository gameSessionRepository;

  FutureOr<void> _handleEvent(DashboardEvent event, Emitter<DashboardState> emit) async {
    if (event is DashboardEmptyEvent) {
      emit(DasboardEmptyState());
      return;
    }
    if (event is DashboardSessionLoadedEvent) {
      emit(DashboardLoadedState(
        totalSessions: event.totalSessions,
        totalStages: event.totalStages,
        totalMoves: event.totalMoves,
        totalWrong: event.totalWrong,
        totalCorrect: event.totalCorrect,
      ));
      return;
    }

    if (event is DasboardSessionLoadedWithActionErrorsEvent) {
      emit(DashboardLoadedWithActionErrorsState(
        totalSessions: event.totalSessions,
        totalStages: event.totalStages,
        totalMoves: event.totalMoves,
        totalWrong: event.totalWrong,
        totalCorrect: event.totalCorrect,
        actionErrors: event.actionErrors,
      ));
      return;
    }
  }

  Future<void> _init() async {
    List<GameSessionDto>? sessions = await gameSessionRepository.getAll();
    if (sessions == null || sessions.isEmpty) {
      add(DashboardEmptyEvent());
      return;
    }

    int totalSessions = sessions.length;
    int totalStages = sessions.fold<int>(0, (previousValue, element) => previousValue + element.totalStages);
    int totalMoves = sessions.fold<int>(0, (previousValue, element) => previousValue + element.totalMoves);
    int totalWrong = sessions.fold<int>(0, (previousValue, element) => previousValue + element.totalWrongAnswers);
    int totalCorrect = totalMoves - totalWrong;
    DashboardSessionLoadedEvent dashboardSessionLoadedEvent = DashboardSessionLoadedEvent(
      totalSessions: totalSessions,
      totalStages: totalStages,
      totalMoves: totalMoves,
      totalWrong: totalWrong,
      totalCorrect: totalCorrect,
    );

    _calculateActionErrors(sessions, dashboardSessionLoadedEvent);
  }

  void _calculateActionErrors(List<GameSessionDto> sessions, DashboardSessionLoadedEvent dashboardSessionLoadedEvent) {
    List<GameSessionAction> actions = sessions.map((e) => e.totalActions).expand((element) => element).toList();
    Map<String, GameSessionAction> groupedActions =
        actions.fold<Map<String, GameSessionAction>>({}, (previousValue, element) {
      if (previousValue.containsKey(element.actionName)) {
        previousValue[element.actionName]!.totalPlayed += element.totalPlayed;
        previousValue[element.actionName]!.totalWrong += element.totalPlayed;
        return previousValue;
      }
      previousValue[element.actionName] = element;
      return previousValue;
    });
    List<GameSessionAction> topErrors = groupedActions.values.where((e) => e.totalWrong > 0).toList()
      ..sort((a, b) => b.totalWrong.compareTo(a.totalWrong));

    List<GameSessionAction> top5Errors = topErrors.take(5).toList();
    if (top5Errors.isNotEmpty) {
      add(DasboardSessionLoadedWithActionErrorsEvent(
        totalSessions: dashboardSessionLoadedEvent.totalSessions,
        totalStages: dashboardSessionLoadedEvent.totalStages,
        totalMoves: dashboardSessionLoadedEvent.totalMoves,
        totalWrong: dashboardSessionLoadedEvent.totalWrong,
        totalCorrect: dashboardSessionLoadedEvent.totalCorrect,
        actionErrors: topErrors.take(5).toList(),
      ));
      return;
    }
    add(dashboardSessionLoadedEvent);
  }
}
