import 'package:aba/core/domain/models/action_item_entity.dart';
import 'package:flutter/widgets.dart';

final class ActionAudio {
  String audioPathOrEmpty(ActionItemEntity actionGroup, BuildContext context) {
    if (!_baseAudioName.containsKey(actionGroup.group)) {
      return '';
    }
    switch (Localizations.localeOf(context).languageCode) {
      case 'en':
        return _enBasePath + _baseAudioName[actionGroup.group]!;
      case 'es':
        return _esBasePath + _baseAudioName[actionGroup.group]!;
      case 'de':
        return _deBasePath + _baseAudioName[actionGroup.group]!;
      case 'pt':
        return _ptBasePath + _baseAudioName[actionGroup.group]!;
      case 'fr':
        return _frBasePath + _baseAudioName[actionGroup.group]!;
      default:
        return _enBasePath + _baseAudioName[actionGroup.group]!;
    }
  }

  final String _deBasePath = 'assets/actions_audio/de/';
  final String _enBasePath = 'assets/actions_audio/en/';
  final String _esBasePath = 'assets/actions_audio/es/';
  final String _frBasePath = 'assets/actions_audio/fr/';
  final String _ptBasePath = 'assets/actions_audio/pt/';

  final Map<ActionGroup, String> _baseAudioName = {
    ActionGroup.answeringPhone: 'actionAnsweringPhone.mp3',
    ActionGroup.bathing: 'actionBathing.mp3',
    ActionGroup.blowingBubbles: 'actionBlowingBubbles.mp3',
    ActionGroup.brushingHair: 'actionBrushingHair.mp3',
    ActionGroup.brushingTeeth: 'actionBrushingTeeth.mp3',
    ActionGroup.buttoningShirt: 'actionButtoningShirt.mp3',
    ActionGroup.catPlayingWithWoolBall: 'actionCatPlayingWithWoolBall.mp3',
    ActionGroup.catchingBall: 'actionCatchingBall.mp3',
    ActionGroup.chasingButterflies: 'actionChasingButterflies.mp3',
    ActionGroup.clappingHands: 'actionClappingHands.mp3',
    ActionGroup.clearingTable: 'actionClearingTable.mp3',
    ActionGroup.climbingStairs: 'actionClimbingStairs.mp3',
    ActionGroup.climbingTree: 'actionClimbingTree.mp3',
    ActionGroup.cooking: 'actionCooking.mp3',
    ActionGroup.crying: 'actionCrying.mp3',
    ActionGroup.custom: 'actionCustom.mp3',
    ActionGroup.dancing: 'actionDancing.mp3',
    ActionGroup.dog: 'actionDog.mp3',
    ActionGroup.drawing: 'actionDrawing.mp3',
    ActionGroup.drinkingWater: 'actionDrinkingWater.mp3',
    ActionGroup.eating: 'actionEating.mp3',
    ActionGroup.jumpingRope: 'actionJumpingRope.mp3',
    ActionGroup.playingBlocks: 'actionPlayingBlocks.mp3',
    ActionGroup.playingWithDog: 'actionPlayingWithDog.mp3',
    ActionGroup.readingBook: 'actionReadingBook.mp3',
    ActionGroup.receivingGift: 'actionReceivingGift.mp3',
    ActionGroup.ridingBike: 'actionRidingBike.mp3',
    ActionGroup.running: 'actionRunning.mp3',
    ActionGroup.singing: 'actionSinging.mp3',
    ActionGroup.sleeping: 'actionSleeping.mp3',
    ActionGroup.swinging: 'actionSwinging.mp3',
    ActionGroup.usingComputer: 'actionUsingComputer.mp3',
    ActionGroup.washingDishes: 'actionWashingDishes.mp3',
    ActionGroup.washingHands: 'actionWashingHands.mp3',
    ActionGroup.watchingTV: 'actionWatchingTV.mp3',
    ActionGroup.wateringPlants: 'actionWateringPlants.mp3',
  };
}
