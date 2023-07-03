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
    if(event is DashboardEmptyEvent) {
      emit(DasboardEmptyState());
      return;
    }
    if(event is DashboardSessionLoaded) {
      emit(DashboardLoadedState(
        totalSessions: event.totalSessions,
        totalStages: event.totalStages,
        totalMoves: event.totalMoves,
        totalWrong: event.totalWrong,
        totalCorrect: event.totalCorrect,
      ));
      return;
    }
  }

  Future<void> _init() async {
    List<GameSessionDto>? sessions = await gameSessionRepository.getAll();
    if (sessions == null) {
      add(DashboardEmptyEvent());
    }

    sessions as List<GameSessionDto>;

    int totalSessions = sessions.length;
    int totalStages = sessions.fold<int>(0, (previousValue, element) => previousValue + element.totalStages);
    int totalMoves = sessions.fold<int>(0, (previousValue, element) => previousValue + element.totalMoves);
    int totalWrong = sessions.fold<int>(0, (previousValue, element) => previousValue + element.totalWrongAnswers);
    int totalCorrect = totalMoves - totalWrong;
    add(DashboardSessionLoaded(
      totalSessions: totalSessions,
      totalStages: totalStages,
      totalMoves: totalMoves,
      totalWrong: totalWrong,
      totalCorrect: totalCorrect,
    ));
  }
}
