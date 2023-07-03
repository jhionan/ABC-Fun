import 'package:abc_fun/core/domain/models/action_item_entity.dart';

final class ActionStatisticsEntity {
  ActionStatisticsEntity({
    required this.actionName,
    required this.totalShown,
    required this.totalIncorrect,
    required this.actionGroup
  });

  final String actionName;
  final int totalShown;
  final int totalIncorrect;
  final ActionGroup actionGroup;
  double get errorRate =>  totalIncorrect / totalShown;
  double get errorRatePercentage => errorRate == double.infinity ? 0 : errorRate * 100;
}

final class TotalActionResults {
  TotalActionResults({
    required this.totalShown,
    required this.averangeCorrect,
    required this.completedRounds,
  });

  final int totalShown;
  final double averangeCorrect;
  final int completedRounds;
}
