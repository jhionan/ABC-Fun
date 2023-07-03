import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/domain/action_items_repository.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';

class ActionItemsDefaultDataSource implements ActionItemsRepository {
  @override
  Future<List<ActionCustomItemEntity>> getAllItems() async {
    return <ActionItemEntity>[
      ActionItemEntity(
        name: ActionGroup.answeringPhone.name,
        dificulty: 3,
        group: ActionGroup.answeringPhone,
        imagePath: ActionImages.answeringPhone,
      ),
      ActionItemEntity(
        name: ActionGroup.bathing.name,
        dificulty: 2,
        group: ActionGroup.bathing,
        imagePath: ActionImages.bathing,
      ),
      ActionItemEntity(
        name: ActionGroup.bathing.name,
        dificulty: 2,
        group: ActionGroup.bathing,
        imagePath: ActionImages.bathing1,
      ),
      ActionItemEntity(
        name: ActionGroup.bathing.name,
        dificulty: 2,
        group: ActionGroup.bathing,
        imagePath: ActionImages.bathing2,
      ),
      ActionItemEntity(
        name: ActionGroup.brushingHair.name,
        dificulty: 2,
        group: ActionGroup.brushingHair,
        imagePath: ActionImages.brushingHair,
      ),
      ActionItemEntity(
        name: ActionGroup.brushingHair.name,
        dificulty: 2,
        group: ActionGroup.brushingHair,
        imagePath: ActionImages.brushingHair1,
      ),
      ActionItemEntity(
        name: ActionGroup.brushingTeeth.name,
        dificulty: 2,
        group: ActionGroup.brushingTeeth,
        imagePath: ActionImages.brushingTeeth,
      ),
      ActionItemEntity(
        name: ActionGroup.brushingTeeth.name,
        dificulty: 2,
        group: ActionGroup.brushingTeeth,
        imagePath: ActionImages.brushingTeeth1,
      ),
      ActionItemEntity(
        name: ActionGroup.brushingTeeth.name,
        dificulty: 2,
        group: ActionGroup.brushingTeeth,
        imagePath: ActionImages.brushingTeeth2,
      ),
      ActionItemEntity(
        name: ActionGroup.buttoningShirt.name,
        dificulty: 2,
        group: ActionGroup.buttoningShirt,
        imagePath: ActionImages.buttoningShirt,
      ),
      ActionItemEntity(
        name: ActionGroup.buttoningShirt.name,
        dificulty: 2,
        group: ActionGroup.buttoningShirt,
        imagePath: ActionImages.buttoningShirt1,
      ),
      ActionItemEntity(
        name: ActionGroup.catchingBall.name,
        dificulty: 2,
        group: ActionGroup.catchingBall,
        imagePath: ActionImages.catchingBall,
      ),
      ActionItemEntity(
        name: ActionGroup.catchingBall.name,
        dificulty: 2,
        group: ActionGroup.catchingBall,
        imagePath: ActionImages.catchingBall1,
      ),
      ActionItemEntity(
        name: ActionGroup.catchingBall.name,
        dificulty: 2,
        group: ActionGroup.catchingBall,
        imagePath: ActionImages.catchingBall2,
      ),
      ActionItemEntity(
        name: ActionGroup.catchingBall.name,
        dificulty: 2,
        group: ActionGroup.catchingBall,
        imagePath: ActionImages.catchingBall3,
      ),
      ActionItemEntity(
        name: ActionGroup.catchingBall.name,
        dificulty: 2,
        group: ActionGroup.catchingBall,
        imagePath: ActionImages.catchingBall4,
      ),
      ActionItemEntity(
        name: ActionGroup.catPlayingWithWoolBall.name,
        dificulty: 2,
        group: ActionGroup.catPlayingWithWoolBall,
        imagePath: ActionImages.catPlayingWithWoolBall,
      ),
      ActionItemEntity(
        name: ActionGroup.catPlayingWithWoolBall.name,
        dificulty: 2,
        group: ActionGroup.catPlayingWithWoolBall,
        imagePath: ActionImages.catPlayingWithWoolBall1,
      ),
      ActionItemEntity(
        name: ActionGroup.catPlayingWithWoolBall.name,
        dificulty: 2,
        group: ActionGroup.catPlayingWithWoolBall,
        imagePath: ActionImages.catPlayingWithWoolBall2,
      ),
      ActionItemEntity(
        name: ActionGroup.chasingButterflies.name,
        dificulty: 2,
        group: ActionGroup.chasingButterflies,
        imagePath: ActionImages.chasingButterflies,
      ),
      ActionItemEntity(
        name: ActionGroup.chasingButterflies.name,
        dificulty: 2,
        group: ActionGroup.chasingButterflies,
        imagePath: ActionImages.chasingButterflies1,
      ),
      ActionItemEntity(
        name: ActionGroup.chasingButterflies.name,
        dificulty: 2,
        group: ActionGroup.chasingButterflies,
        imagePath: ActionImages.chasingButterflies2,
      ),
      ActionItemEntity(
        name: ActionGroup.chasingButterflies.name,
        dificulty: 2,
        group: ActionGroup.chasingButterflies,
        imagePath: ActionImages.chasingButterflies3,
      ),
      ActionItemEntity(
        name: ActionGroup.chasingButterflies.name,
        dificulty: 2,
        group: ActionGroup.chasingButterflies,
        imagePath: ActionImages.chasingButterflies4,
      ),
      ActionItemEntity(
        name: ActionGroup.clappingHands.name,
        dificulty: 2,
        group: ActionGroup.clappingHands,
        imagePath: ActionImages.clappingHands,
      ),
      ActionItemEntity(
        name: ActionGroup.clappingHands.name,
        dificulty: 2,
        group: ActionGroup.clappingHands,
        imagePath: ActionImages.clappingHands1,
      ),
      ActionItemEntity(
        name: ActionGroup.clappingHands.name,
        dificulty: 2,
        group: ActionGroup.clappingHands,
        imagePath: ActionImages.clappingHands2,
      ),
      ActionItemEntity(
        name: ActionGroup.climbingStairs.name,
        dificulty: 2,
        group: ActionGroup.climbingStairs,
        imagePath: ActionImages.climbingStairs,
      ),
      ActionItemEntity(
        name: ActionGroup.climbingStairs.name,
        dificulty: 2,
        group: ActionGroup.climbingStairs,
        imagePath: ActionImages.climbingStairs1,
      ),
      ActionItemEntity(
        name: ActionGroup.climbingStairs.name,
        dificulty: 2,
        group: ActionGroup.climbingStairs,
        imagePath: ActionImages.climbingStairs2,
      ),
      ActionItemEntity(
        name: ActionGroup.climbingTree.name,
        dificulty: 2,
        group: ActionGroup.climbingTree,
        imagePath: ActionImages.climbingTree,
      ),
      ActionItemEntity(
        name: ActionGroup.climbingTree.name,
        dificulty: 2,
        group: ActionGroup.climbingTree,
        imagePath: ActionImages.climbingTree1,
      ),
      ActionItemEntity(
        name: ActionGroup.climbingTree.name,
        dificulty: 2,
        group: ActionGroup.climbingTree,
        imagePath: ActionImages.climbingTree2,
      ),
      ActionItemEntity(
          name: ActionGroup.cooking.name,
          dificulty: 2,
          group: ActionGroup.cooking,
          imagePath: ActionImages.cooking,
          notAllowedWith: [
            ActionGroup.eating,
          ]),
      ActionItemEntity(
        name: ActionGroup.cooking.name,
        dificulty: 2,
        group: ActionGroup.cooking,
        imagePath: ActionImages.cooking1,
      ),
      ActionItemEntity(
        name: ActionGroup.cooking.name,
        dificulty: 2,
        group: ActionGroup.cooking,
        imagePath: ActionImages.cooking2,
      ),
      ActionItemEntity(
        name: ActionGroup.cooking.name,
        dificulty: 2,
        group: ActionGroup.cooking,
        imagePath: ActionImages.cooking3,
      ),
      ActionItemEntity(
        name: ActionGroup.cooking.name,
        dificulty: 2,
        group: ActionGroup.cooking,
        imagePath: ActionImages.cooking4,
      ),
      ActionItemEntity(
        name: ActionGroup.cooking.name,
        dificulty: 2,
        group: ActionGroup.cooking,
        imagePath: ActionImages.cooking5,
      ),
      ActionItemEntity(
        name: ActionGroup.cooking.name,
        dificulty: 2,
        group: ActionGroup.cooking,
        imagePath: ActionImages.cooking6,
      ),
      ActionItemEntity(
        name: ActionGroup.crying.name,
        dificulty: 2,
        group: ActionGroup.crying,
        imagePath: ActionImages.crying,
      ),
      ActionItemEntity(
        name: ActionGroup.crying.name,
        dificulty: 2,
        group: ActionGroup.crying,
        imagePath: ActionImages.crying1,
      ),
      ActionItemEntity(
        name: ActionGroup.crying.name,
        dificulty: 2,
        group: ActionGroup.crying,
        imagePath: ActionImages.crying2,
      ),
      ActionItemEntity(
          name: ActionGroup.dancing.name, dificulty: 2, group: ActionGroup.dancing, imagePath: ActionImages.dancing),
      ActionItemEntity(
          name: ActionGroup.dancing.name, dificulty: 2, group: ActionGroup.dancing, imagePath: ActionImages.dancing1),
      ActionItemEntity(
          name: ActionGroup.dancing.name, dificulty: 2, group: ActionGroup.dancing, imagePath: ActionImages.dancing2),
      ActionItemEntity(
          name: ActionGroup.dancing.name, dificulty: 2, group: ActionGroup.dancing, imagePath: ActionImages.dancing3),
      ActionItemEntity(name: ActionGroup.dog.name, dificulty: 1, group: ActionGroup.dog, imagePath: ActionImages.dog),
      ActionItemEntity(name: ActionGroup.dog.name, dificulty: 1, group: ActionGroup.dog, imagePath: ActionImages.dog1),
      ActionItemEntity(name: ActionGroup.dog.name, dificulty: 1, group: ActionGroup.dog, imagePath: ActionImages.dog2),
      ActionItemEntity(name: ActionGroup.dog.name, dificulty: 1, group: ActionGroup.dog, imagePath: ActionImages.dog3),
      ActionItemEntity(
          name: ActionGroup.drawing.name, dificulty: 2, group: ActionGroup.drawing, imagePath: ActionImages.drawing),
      ActionItemEntity(
          name: ActionGroup.drawing.name, dificulty: 2, group: ActionGroup.drawing, imagePath: ActionImages.drawing1),
      ActionItemEntity(
          name: ActionGroup.drawing.name, dificulty: 2, group: ActionGroup.drawing, imagePath: ActionImages.drawing2),
      ActionItemEntity(
          name: ActionGroup.drawing.name, dificulty: 2, group: ActionGroup.drawing, imagePath: ActionImages.drawing3),
      ActionItemEntity(
          name: ActionGroup.drawing.name, dificulty: 2, group: ActionGroup.drawing, imagePath: ActionImages.drawing4),
      ActionItemEntity(
          name: ActionGroup.drinkingWater.name,
          dificulty: 2,
          group: ActionGroup.drinkingWater,
          imagePath: ActionImages.drinkingWater),
      ActionItemEntity(
          name: ActionGroup.drinkingWater.name,
          dificulty: 2,
          group: ActionGroup.drinkingWater,
          imagePath: ActionImages.drinkingWater1),
      ActionItemEntity(
          name: ActionGroup.drinkingWater.name,
          dificulty: 2,
          group: ActionGroup.drinkingWater,
          imagePath: ActionImages.drinkingWater2),
      ActionItemEntity(
          name: ActionGroup.drinkingWater.name,
          dificulty: 2,
          group: ActionGroup.drinkingWater,
          imagePath: ActionImages.drinkingWater3),
      ActionItemEntity(
          name: ActionGroup.eating.name, dificulty: 2, group: ActionGroup.eating, imagePath: ActionImages.eating),
      ActionItemEntity(
          name: ActionGroup.eating.name, dificulty: 2, group: ActionGroup.eating, imagePath: ActionImages.eating1),
      ActionItemEntity(
          name: ActionGroup.eating.name, dificulty: 2, group: ActionGroup.eating, imagePath: ActionImages.eating2),
      ActionItemEntity(
          name: ActionGroup.jumpingRope.name,
          dificulty: 2,
          group: ActionGroup.jumpingRope,
          imagePath: ActionImages.jumpingRope),
      ActionItemEntity(
          name: ActionGroup.jumpingRope.name,
          dificulty: 2,
          group: ActionGroup.jumpingRope,
          imagePath: ActionImages.jumpingRope1),
      ActionItemEntity(
          name: ActionGroup.jumpingRope.name,
          dificulty: 2,
          group: ActionGroup.jumpingRope,
          imagePath: ActionImages.jumpingRope2),
      ActionItemEntity(
          name: ActionGroup.playingBlocks.name,
          dificulty: 2,
          group: ActionGroup.playingBlocks,
          imagePath: ActionImages.playingBlocks),
      ActionItemEntity(
          name: ActionGroup.playingBlocks.name,
          dificulty: 2,
          group: ActionGroup.playingBlocks,
          imagePath: ActionImages.playingBlocks1),
      ActionItemEntity(
          name: ActionGroup.playingBlocks.name,
          dificulty: 2,
          group: ActionGroup.playingBlocks,
          imagePath: ActionImages.playingBlocks2),
      ActionItemEntity(
          name: ActionGroup.playingBlocks.name,
          dificulty: 2,
          group: ActionGroup.playingBlocks,
          imagePath: ActionImages.playingBlocks3),
      ActionItemEntity(
          name: ActionGroup.playingBlocks.name,
          dificulty: 2,
          group: ActionGroup.playingBlocks,
          imagePath: ActionImages.playingBlocks4),
      ActionItemEntity(
          name: ActionGroup.playingWithDog.name,
          dificulty: 2,
          group: ActionGroup.playingWithDog,
          imagePath: ActionImages.playingWithDog),
      ActionItemEntity(
          name: ActionGroup.playingWithDog.name,
          dificulty: 2,
          group: ActionGroup.playingWithDog,
          imagePath: ActionImages.playingWithDog1),
      ActionItemEntity(
          name: ActionGroup.playingWithDog.name,
          dificulty: 2,
          group: ActionGroup.playingWithDog,
          imagePath: ActionImages.playingWithDog2),
      ActionItemEntity(
          name: ActionGroup.readingBook.name,
          dificulty: 2,
          group: ActionGroup.readingBook,
          imagePath: ActionImages.readingBook),
      ActionItemEntity(
          name: ActionGroup.readingBook.name,
          dificulty: 2,
          group: ActionGroup.readingBook,
          imagePath: ActionImages.readingBook1),
      ActionItemEntity(
          name: ActionGroup.readingBook.name,
          dificulty: 2,
          group: ActionGroup.readingBook,
          imagePath: ActionImages.readingBook2),
      ActionItemEntity(
          name: ActionGroup.readingBook.name,
          dificulty: 2,
          group: ActionGroup.readingBook,
          imagePath: ActionImages.readingBook3),
      ActionItemEntity(
          name: ActionGroup.readingBook.name,
          dificulty: 2,
          group: ActionGroup.readingBook,
          imagePath: ActionImages.readingBook4),
      ActionItemEntity(
          name: ActionGroup.readingBook.name,
          dificulty: 2,
          group: ActionGroup.readingBook,
          imagePath: ActionImages.readingBook5),
      ActionItemEntity(
          name: ActionGroup.readingBook.name,
          dificulty: 2,
          group: ActionGroup.readingBook,
          imagePath: ActionImages.readingBook6),
      ActionItemEntity(
          name: ActionGroup.readingBook.name,
          dificulty: 2,
          group: ActionGroup.readingBook,
          imagePath: ActionImages.readingBook7),
      ActionItemEntity(
          name: ActionGroup.receivingGift.name,
          dificulty: 2,
          group: ActionGroup.receivingGift,
          imagePath: ActionImages.receivingGift),
      ActionItemEntity(
          name: ActionGroup.receivingGift.name,
          dificulty: 2,
          group: ActionGroup.receivingGift,
          imagePath: ActionImages.receivingGift1),
      ActionItemEntity(
          name: ActionGroup.receivingGift.name,
          dificulty: 2,
          group: ActionGroup.receivingGift,
          imagePath: ActionImages.receivingGift2),
      ActionItemEntity(
          name: ActionGroup.receivingGift.name,
          dificulty: 2,
          group: ActionGroup.receivingGift,
          imagePath: ActionImages.receivingGift3),
      ActionItemEntity(
          name: ActionGroup.receivingGift.name,
          dificulty: 2,
          group: ActionGroup.receivingGift,
          imagePath: ActionImages.receivingGift4),
      ActionItemEntity(
          name: ActionGroup.ridingBike.name,
          dificulty: 2,
          group: ActionGroup.ridingBike,
          imagePath: ActionImages.ridingBike),
      ActionItemEntity(
          name: ActionGroup.ridingBike.name,
          dificulty: 2,
          group: ActionGroup.ridingBike,
          imagePath: ActionImages.ridingBike1),
      ActionItemEntity(
          name: ActionGroup.ridingBike.name,
          dificulty: 2,
          group: ActionGroup.ridingBike,
          imagePath: ActionImages.ridingBike2),
      ActionItemEntity(
          name: ActionGroup.ridingBike.name,
          dificulty: 2,
          group: ActionGroup.ridingBike,
          imagePath: ActionImages.ridingBike3),
      ActionItemEntity(
          name: ActionGroup.running.name, dificulty: 2, group: ActionGroup.running, imagePath: ActionImages.running),
      ActionItemEntity(
          name: ActionGroup.running.name, dificulty: 2, group: ActionGroup.running, imagePath: ActionImages.running1),
      ActionItemEntity(
          name: ActionGroup.running.name, dificulty: 2, group: ActionGroup.running, imagePath: ActionImages.running2),
      ActionItemEntity(
          name: ActionGroup.singing.name, dificulty: 2, group: ActionGroup.singing, imagePath: ActionImages.singing),
      ActionItemEntity(
          name: ActionGroup.singing.name, dificulty: 2, group: ActionGroup.singing, imagePath: ActionImages.singing1),
      ActionItemEntity(
          name: ActionGroup.singing.name, dificulty: 2, group: ActionGroup.singing, imagePath: ActionImages.singing2),
      ActionItemEntity(
          name: ActionGroup.sleeping.name, dificulty: 2, group: ActionGroup.sleeping, imagePath: ActionImages.sleeping),
      ActionItemEntity(
          name: ActionGroup.sleeping.name,
          dificulty: 2,
          group: ActionGroup.sleeping,
          imagePath: ActionImages.sleeping1),
      ActionItemEntity(
          name: ActionGroup.sleeping.name,
          dificulty: 2,
          group: ActionGroup.sleeping,
          imagePath: ActionImages.sleeping2),
      ActionItemEntity(
          name: ActionGroup.sleeping.name,
          dificulty: 2,
          group: ActionGroup.sleeping,
          imagePath: ActionImages.sleeping3),
      ActionItemEntity(
          name: ActionGroup.usingComputer.name,
          dificulty: 2,
          group: ActionGroup.usingComputer,
          imagePath: ActionImages.usingComputer),
      ActionItemEntity(
          name: ActionGroup.usingComputer.name,
          dificulty: 2,
          group: ActionGroup.usingComputer,
          imagePath: ActionImages.usingComputer1),
      ActionItemEntity(
          name: ActionGroup.usingComputer.name,
          dificulty: 2,
          group: ActionGroup.usingComputer,
          imagePath: ActionImages.usingComputer2),
      ActionItemEntity(
          name: ActionGroup.usingComputer.name,
          dificulty: 2,
          group: ActionGroup.usingComputer,
          imagePath: ActionImages.usingComputer3),
      ActionItemEntity(
          name: ActionGroup.usingComputer.name,
          dificulty: 2,
          group: ActionGroup.usingComputer,
          imagePath: ActionImages.usingComputer4),
      ActionItemEntity(
          name: ActionGroup.usingComputer.name,
          dificulty: 2,
          group: ActionGroup.usingComputer,
          imagePath: ActionImages.usingComputer5),
      ActionItemEntity(
          name: ActionGroup.usingComputer.name,
          dificulty: 2,
          group: ActionGroup.usingComputer,
          imagePath: ActionImages.usingComputer6),
      ActionItemEntity(
          name: ActionGroup.usingComputer.name,
          dificulty: 2,
          group: ActionGroup.usingComputer,
          imagePath: ActionImages.usingComputer7),
      ActionItemEntity(
          name: ActionGroup.washingDishes.name,
          dificulty: 2,
          group: ActionGroup.washingDishes,
          imagePath: ActionImages.washingDishes),
      ActionItemEntity(
          name: ActionGroup.washingDishes.name,
          dificulty: 2,
          group: ActionGroup.washingDishes,
          imagePath: ActionImages.washingDishes1),
      ActionItemEntity(
          name: ActionGroup.washingDishes.name,
          dificulty: 2,
          group: ActionGroup.washingDishes,
          imagePath: ActionImages.washingDishes2),
      ActionItemEntity(
          name: ActionGroup.washingHands.name,
          dificulty: 2,
          group: ActionGroup.washingHands,
          imagePath: ActionImages.washingHands),
      ActionItemEntity(
          name: ActionGroup.washingHands.name,
          dificulty: 2,
          group: ActionGroup.washingHands,
          imagePath: ActionImages.washingHands1),
      ActionItemEntity(
          name: ActionGroup.washingHands.name,
          dificulty: 2,
          group: ActionGroup.washingHands,
          imagePath: ActionImages.washingHands2),
      ActionItemEntity(
          name: ActionGroup.washingHands.name,
          dificulty: 2,
          group: ActionGroup.washingHands,
          imagePath: ActionImages.washingHands3),
      ActionItemEntity(
          name: ActionGroup.washingHands.name,
          dificulty: 2,
          group: ActionGroup.washingHands,
          imagePath: ActionImages.washingHands4),
      ActionItemEntity(
          name: ActionGroup.watchingTV.name,
          dificulty: 2,
          group: ActionGroup.watchingTV,
          imagePath: ActionImages.watchingTV),
      ActionItemEntity(
          name: ActionGroup.watchingTV.name,
          dificulty: 2,
          group: ActionGroup.watchingTV,
          imagePath: ActionImages.watchingTV1),
      ActionItemEntity(
          name: ActionGroup.watchingTV.name,
          dificulty: 2,
          group: ActionGroup.watchingTV,
          imagePath: ActionImages.watchingTV2),
      ActionItemEntity(
          name: ActionGroup.wateringPlants.name,
          dificulty: 2,
          group: ActionGroup.wateringPlants,
          imagePath: ActionImages.wateringPlants),
      ActionItemEntity(
          name: ActionGroup.wateringPlants.name,
          dificulty: 2,
          group: ActionGroup.wateringPlants,
          imagePath: ActionImages.wateringPlants1),
      ActionItemEntity(
          name: ActionGroup.wateringPlants.name,
          dificulty: 2,
          group: ActionGroup.wateringPlants,
          imagePath: ActionImages.wateringPlants2),
    ]
        .map((e) => ActionCustomItemEntity(
              dificulty: e.dificulty,
              group: e.group,
              imagePath: e.imagePath,
              name: e.name,
              notAllowedWith: e.notAllowedWith,
              isActive: e.isActive,
            ))
        .toList();
  }

  @override
  Future<void> addItem(ActionCustomItemEntity item) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(ActionCustomItemEntity item) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteManyItems(List<ActionCustomItemEntity> items) {
    throw UnimplementedError();
  }

  @override
  Future<void> addAllItems(List<ActionCustomItemEntity> items) {
    throw UnimplementedError();
  }
}
