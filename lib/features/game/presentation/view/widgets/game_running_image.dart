import 'package:aba/core/domain/models/action_item_entity.dart';
import 'package:flutter/material.dart';

class GameRunningImage extends StatelessWidget {
  const GameRunningImage({super.key, required this.actionItemEntity});

  final ActionItemEntity actionItemEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(actionItemEntity.imagePath, fit: BoxFit.contain)),
      ),
    );
  }
}