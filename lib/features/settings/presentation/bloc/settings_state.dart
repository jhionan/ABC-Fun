part of 'settings_bloc.dart';

sealed class SettingsState {
  final int maxStageQuantity = kMaxStageQuantity;
  final int maxActionsPerStage = kMaxActionsPerStage;
  final int minActionsPerStage = kMinActionsPerStage;
}

class SettingsInitial extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  SettingsLoadedState({
    this.rewardImageBytes,
    required this.selectedStageQuantity,
    required this.selectedActionsPerStage,
  });
  final List<int>? rewardImageBytes;
  final int selectedStageQuantity;
  final int selectedActionsPerStage;
}
