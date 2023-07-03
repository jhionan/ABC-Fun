import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:isar/isar.dart';

part 'settings_dto.g.dart';

@collection
class SettingsDto implements SettingsEntity {
  SettingsDto({
    this.id,
    this.rewardImageBytes,
    required this.selectedActionsPerStage,
    required this.selectedStageQuantity,
  });

  Id? id;

  @override
  List<byte>? rewardImageBytes;

  @override
  int selectedActionsPerStage;

  @override
  int selectedStageQuantity;
}
