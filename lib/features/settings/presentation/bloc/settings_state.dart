

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SettingsLoadedState &&
      listEquals(other.rewardImageBytes, rewardImageBytes) &&
      other.selectedStageQuantity == selectedStageQuantity &&
      other.selectedActionsPerStage == selectedActionsPerStage;
  }

  @override
  int get hashCode => rewardImageBytes.hashCode ^ selectedStageQuantity.hashCode ^ selectedActionsPerStage.hashCode;
}
