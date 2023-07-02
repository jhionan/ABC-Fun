import 'package:abc_fun/core/domain/models/action_item_entity.dart';

final class ActionStatistics {
  ActionStatistics({
    required this.action,
    required this.totalShown,
    required this.totalCorrect,
    required this.totalIncorrect,
  });

  final ActionItemEntity action;
  final int totalShown;
  final int totalCorrect;
  final int totalIncorrect;
  double get errorRate => totalIncorrect / totalShown;
  double get errorRatePercentage => errorRate * 100;
}

final class TotalActionResults {
  TotalActionResults({
    required this.totalShown,
    required this.averangeCorrect,
    required this.completedRounds,
  });

  final double totalShown;
  final double averangeCorrect;
  final double completedRounds;
}
