part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class SettingsStageQuantityEvent extends SettingsEvent {
  SettingsStageQuantityEvent(this.stageQuantity);
  final int stageQuantity;
}

class SettingsLoadedEvent extends SettingsEvent {
  final int selectedStageQuantity;
  final int selectedActionsPerStage;
  final List<int>? rewardImageBytes;
  SettingsLoadedEvent({
    required this.selectedStageQuantity,
    required this.selectedActionsPerStage,
    this.rewardImageBytes,
  });
}

class SettingsActionsPerStageEvent extends SettingsEvent {
  SettingsActionsPerStageEvent(this.actionsPerStage);
  final int actionsPerStage;
}

class SettingsRewardImageBytesEvent extends SettingsEvent {
  SettingsRewardImageBytesEvent(this.rewardImageBytes);
  final List<int>? rewardImageBytes;
}
