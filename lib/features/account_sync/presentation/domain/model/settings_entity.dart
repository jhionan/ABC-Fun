import 'package:abc_fun/core/db/schemas/settings_dto.dart';

class SettingsEntity {
  SettingsEntity({
    required this.selectedStageQuantity,
    required this.selectedActionsPerStage,
    this.rewardImageBytes,
  });
  int selectedStageQuantity;
  int selectedActionsPerStage;
  List<int>? rewardImageBytes;

  SettingsEntity.fromDto(SettingsDto settingsDto)
      : selectedStageQuantity = settingsDto.selectedStageQuantity,
        selectedActionsPerStage = settingsDto.selectedActionsPerStage,
        rewardImageBytes = settingsDto.rewardImageBytes;
}
