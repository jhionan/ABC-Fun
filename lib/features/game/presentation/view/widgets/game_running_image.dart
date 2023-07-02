import 'dart:typed_data';

import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:flutter/material.dart';

class GameRunningImage extends StatelessWidget {
  const GameRunningImage({super.key, required this.actionItemEntity});

  final ActionItemEntity actionItemEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ClipRRect(borderRadius: BorderRadius.circular(24), child: _imageFromEntityType(actionItemEntity)),
      ),
    );
  }

  Widget _imageFromEntityType(ActionItemEntity e) {
    if (e.group == ActionGroup.custom) {
      ActionCustomItemEntity item = e as ActionCustomItemEntity;
      return Image.memory(
        Uint8List.fromList(item.imageBytes!),
        fit: BoxFit.contain,
        key: UniqueKey(),
      );
    }
    return Image.asset(
      e.imagePath,
      fit: BoxFit.contain,
      key: UniqueKey(),
    );
  }
}
