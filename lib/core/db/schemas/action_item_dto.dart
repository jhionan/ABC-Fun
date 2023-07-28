import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_item_dto.g.dart';

@JsonSerializable()
@collection
class ActionItemDto implements ActionItemEntity {
  ActionItemDto({
    required this.group,
    this.dificulty = 2,
    this.imagePath = '',
    this.imageBytes,
    this.audioBytes,
    required this.audioHash,
    required this.imageHash,
    required this.name,
    this.notAllowedWith = const [],
    required this.isActive,
  });
  @JsonKey(includeToJson: false, includeFromJson: false)
  Id? id;

  @override
  @Enumerated(EnumType.name)
  ActionGroup group;

  @override
  int dificulty;

  @JsonKey(includeToJson: false, includeFromJson: false)
  @override
  String imagePath;

  @override
  String name;
  @JsonKey(includeToJson: false, includeFromJson: false)
  @override
  @Enumerated(EnumType.name)
  List<ActionGroup> notAllowedWith;

  @override
  bool isActive;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<byte>? audioBytes;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<byte>? imageBytes;

  int? imageHash;

  int? audioHash;

  factory ActionItemDto.fromJson(Map<String, dynamic> json) =>
      _$ActionItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ActionItemDtoToJson(this);
}
