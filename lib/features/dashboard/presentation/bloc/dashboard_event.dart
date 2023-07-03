part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardEmptyEvent extends DashboardEvent {}

class DashboardSessionLoadedEvent extends DashboardEvent {
  DashboardSessionLoadedEvent({
    required this.totalSessions,
    required this.totalStages,
    required this.totalMoves,
    required this.totalWrong,
    required this.totalCorrect,
  });

  final int totalSessions;
  final int totalStages;
  final int totalMoves;
  final int totalWrong;
  final int totalCorrect;
}

class DasboardSessionLoadedWithActionErrorsEvent extends DashboardEvent {
  DasboardSessionLoadedWithActionErrorsEvent({
    required this.totalSessions,
    required this.totalStages,
    required this.totalMoves,
    required this.totalWrong,
    required this.totalCorrect,
    required this.actionErrors,
  });

  final int totalSessions;
  final int totalStages;
  final int totalMoves;
  final int totalWrong;
  final int totalCorrect;
  final List<GameSessionAction> actionErrors;
}
