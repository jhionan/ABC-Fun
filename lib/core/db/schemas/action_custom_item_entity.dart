import 'package:aba/core/domain/models/action_item_entity.dart';

import 'package:isar/isar.dart';

part 'action_custom_item_entity.g.dart';

@collection
class ActionCustomItemEntity implements ActionItemEntity {
  ActionCustomItemEntity({
    required this.group,
    required this.dificulty,
    required this.imagePath,
    this.imageBytes,
    this.audioBytes,
    required this.name,
    required this.notAllowedWith,
    required this.isActive,
  });

  Id? id;

  @override
  @Enumerated(EnumType.name)
  ActionGroup group;

  @override
  int dificulty;

  @override
  String imagePath;

  @override
  String name;

  @override
  @Enumerated(EnumType.name)
  List<ActionGroup> notAllowedWith;

  @override
  bool isActive;

  List<byte>? audioBytes;

  List<byte>? imageBytes;

  

  
}
