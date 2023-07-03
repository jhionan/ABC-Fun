import 'dart:typed_data';

abstract interface class SettingsRepository {
  int get selectedStageQuantity;
  int get selectedActionsPerStage;
  Uint8List? get rewardImageBytes;
  
  Future<void> saveStageQuantity(int stageQuantity);
  Future<void> saveActionsPerStage(int actionsPerStage);
  Future<void> saveRewardImageBytes(Uint8List rewardImageBytes);
}