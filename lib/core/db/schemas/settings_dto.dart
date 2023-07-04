import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings_dto.g.dart';

@JsonSerializable()
@collection
class SettingsDto implements SettingsEntity {
  SettingsDto({
    this.id,
    this.rewardImageBytes,
    required this.selectedActionsPerStage,
    required this.selectedStageQuantity,
  });

  @JsonKey(includeToJson: false, includeFromJson: false)
  Id? id;
  
  @JsonKey(includeToJson: false, includeFromJson: false)
  @override
  List<byte>? rewardImageBytes;

  @override
  int selectedActionsPerStage;

  @override
  int selectedStageQuantity;

  factory SettingsDto.fromJson(Map<String, dynamic> json) => _$SettingsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsDtoToJson(this);
}
