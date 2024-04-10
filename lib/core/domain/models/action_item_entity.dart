import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/core/utils/extensions/string_ext.dart';
import 'package:flutter/widgets.dart';

class ActionItemEntity {
  final ActionGroup group;
  final String name;
  final String imagePath;

  final int dificulty;
  final List<ActionGroup> notAllowedWith;
  final bool isActive;

  const ActionItemEntity({
    required this.group,
    required this.name,
    required this.imagePath,
    required this.dificulty,
    this.isActive = true,
    this.notAllowedWith = const [],
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionItemEntity && other.group == group && other.name.toLowerCase() == name.toLowerCase();
  }

  @override
  int get hashCode {
    return group.hashCode ^ name.hashCode ^ imagePath.hashCode ^ dificulty.hashCode;
  }
}

enum ActionGroup {
  answeringPhone,
  bathing,
  blowingBubbles,
  brushingHair,
  brushingTeeth,
  buttoningShirt,
  catPlayingWithWoolBall,
  catchingBall,
  chasingButterflies,
  clappingHands,
  clearingTable,
  climbingStairs,
  climbingTree,
  cooking,
  crying,
  custom,
  dancing,
  dog,
  drawing,
  drinkingWater,
  eating,
  jumpingRope,
  playingBlocks,
  playingWithDog,
  readingBook,
  receivingGift,
  ridingBike,
  running,
  singing,
  sleeping,
  swinging,
  usingComputer,
  washingDishes,
  washingHands,
  watchingTV,
  wateringPlants;

  factory ActionGroup.fromString(String value) {
    return ActionGroup.values.firstWhere((e) => e.name == value);
  }
}

extension ActionGroupNameEx on ActionItemEntity {
  String actionName(BuildContext context) {
    return group.actionName(context: context, defaultName: name);
  }
}

extension ActionGroupEx on ActionGroup {
  String actionName({required BuildContext context, required String defaultName}) {
    return switch (this) {
      ActionGroup.answeringPhone => context.intl.actionAnsweringPhone,
      ActionGroup.bathing => context.intl.actionBathing,
      ActionGroup.blowingBubbles => context.intl.actionBlowingBubbles,
      ActionGroup.brushingHair => context.intl.actionBrushingHair,
      ActionGroup.brushingTeeth => context.intl.actionBrushingTeeth,
      ActionGroup.buttoningShirt => context.intl.actionButtoningShirt,
      ActionGroup.catPlayingWithWoolBall => context.intl.actionCatPlayingWithWoolBall,
      ActionGroup.catchingBall => context.intl.actionCatchingBall,
      ActionGroup.chasingButterflies => context.intl.actionChasingButterflies,
      ActionGroup.clappingHands => context.intl.actionClappingHands,
      ActionGroup.clearingTable => context.intl.actionClearingTable,
      ActionGroup.climbingStairs => context.intl.actionClimbingStairs,
      ActionGroup.climbingTree => context.intl.actionClimbingTree,
      ActionGroup.cooking => context.intl.actionCooking,
      ActionGroup.crying => context.intl.actionCrying,
      ActionGroup.custom => defaultName.capitalize(),
      ActionGroup.dancing => context.intl.actionDancing,
      ActionGroup.dog => context.intl.actionDog,
      ActionGroup.drawing => context.intl.actionDrawing,
      ActionGroup.drinkingWater => context.intl.actionDrinkingWater,
      ActionGroup.eating => context.intl.actionEating,
      ActionGroup.jumpingRope => context.intl.actionJumpingRope,
      ActionGroup.playingBlocks => context.intl.actionPlayingBlocks,
      ActionGroup.playingWithDog => context.intl.actionPlayingWithDog,
      ActionGroup.readingBook => context.intl.actionReadingBook,
      ActionGroup.receivingGift => context.intl.actionReceivingGift,
      ActionGroup.ridingBike => context.intl.actionRidingBike,
      ActionGroup.running => context.intl.actionRunning,
      ActionGroup.singing => context.intl.actionSinging,
      ActionGroup.sleeping => context.intl.actionSleeping,
      ActionGroup.swinging => context.intl.actionSwinging,
      ActionGroup.usingComputer => context.intl.actionUsingComputer,
      ActionGroup.washingDishes => context.intl.actionWashingDishes,
      ActionGroup.washingHands => context.intl.actionWashingHands,
      ActionGroup.watchingTV => context.intl.actionWatchingTV,
      ActionGroup.wateringPlants => context.intl.actionWateringPlants,
    };
  }
}
