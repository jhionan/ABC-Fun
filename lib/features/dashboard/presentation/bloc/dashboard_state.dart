part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DasboardEmptyState extends DashboardState {}

class DashboardLoadedState extends DashboardState {
  final int totalSessions;
  final int totalStages;
  final int totalMoves;
  final int totalWrong;
  final int totalCorrect;

  DashboardLoadedState({
    required this.totalSessions,
    required this.totalStages,
    required this.totalMoves,
    required this.totalWrong,
    required this.totalCorrect,
  });
}
