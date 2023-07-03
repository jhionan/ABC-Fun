class SettingsEntity {
  SettingsEntity({
    required this.selectedStageQuantity,
    required this.selectedActionsPerStage,
    this.rewardImageBytes,
  });
  int selectedStageQuantity;
  int selectedActionsPerStage;
  List<int>? rewardImageBytes;
}
