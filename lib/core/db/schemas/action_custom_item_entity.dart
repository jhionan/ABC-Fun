import 'package:aba/core/domain/models/action_item_entity.dart';
import 'package:flutter/foundation.dart';

import 'package:isar/isar.dart';

part 'action_custom_item_entity.g.dart';

@collection
class ActionCustomItemEntity implements ActionItemEntity {
  ActionCustomItemEntity({
    required this.group,
    required this.dificulty,
    required this.imagePath,
    Uint8List? imageBytes,
    Uint8List? audioBytes,
    required this.name,
    required this.notAllowedWith,
    required this.isActive,
  }): _imageBytes = imageBytes?.toList(), _audioBytes = audioBytes?.toList();

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

  List<byte>? _audioBytes;

  List<byte>? _imageBytes;

  @ignore
  @override
  Uint8List? get audioBytes => Uint8List.fromList(_audioBytes ?? []);

  @ignore
  @override
  Uint8List? get imageBytes => Uint8List.fromList(_imageBytes ?? []);

  set audioBytes(Uint8List? value) {
    _audioBytes = value?.toList();
  }

  set imageBytes(Uint8List? value) {
    _imageBytes = value?.toList();
  }
}
