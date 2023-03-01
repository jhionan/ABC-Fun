import 'package:aba/core/images.dart';
import 'package:aba/features/game/domain/action_items_repository.dart';
import 'package:aba/features/game/domain/models/action_item_entity.dart';

class ActionItemsLocalDataSourceImp implements ActionItemsRepository {
  @override
  Future<List<ActionItemEntity>> getAllItems() async {
    return <ActionItemEntity>[
      const ActionItemEntity(
        group: ActionGroup.brushingTeeth,
        name: 'Brushing teeth',
        dificulty: 1,
        imagePath: Images.brushingTeeth,
      ),
      const ActionItemEntity(
        group: ActionGroup.brushingTeeth,
        name: 'Brushing teeth1',
        dificulty: 1,
        imagePath: Images.brushingTeeth1,
      ),
      const ActionItemEntity(
        group: ActionGroup.brushingTeeth,
        name: 'Brushing teeth2',
        dificulty: 1,
        imagePath: Images.brushingTeeth2,
      ),
      const ActionItemEntity(
        group: ActionGroup.combingHair,
        name: 'Combing hair',
        dificulty: 1,
        imagePath: Images.combingHair,
      ),
      const ActionItemEntity(
        group: ActionGroup.combingHair,
        name: 'Combing hair1',
        dificulty: 1,
        imagePath: Images.combingHair1,
      ),
      const ActionItemEntity(
        group: ActionGroup.combingHair,
        name: 'Combing hair2',
        dificulty: 1,
        imagePath: Images.combingHair2,
      ),
      const ActionItemEntity(
        group: ActionGroup.drinkingWater,
        name: 'Drinking water',
        dificulty: 1,
        imagePath: Images.drinkingWater,
      ),
      const ActionItemEntity(
        group: ActionGroup.drinkingWater,
        name: 'Drinking water1',
        dificulty: 1,
        imagePath: Images.drinkingWater1,
      ),
      const ActionItemEntity(
        group: ActionGroup.drinkingWater,
        name: 'Drinking water2',
        dificulty: 1,
        imagePath: Images.drinkingWater2,
      ),
      const ActionItemEntity(
        group: ActionGroup.eating,
        name: 'Eating',
        dificulty: 1,
        imagePath: Images.eating,
      ),
      const ActionItemEntity(
        group: ActionGroup.eating,
        name: 'Eating1',
        dificulty: 1,
        imagePath: Images.eating1,
      ),
      const ActionItemEntity(
        group: ActionGroup.eating,
        name: 'Eating2',
        dificulty: 1,
        imagePath: Images.eating2,
      ),
      const ActionItemEntity(
        group: ActionGroup.laughing,
        name: 'Laughing',
        dificulty: 1,
        imagePath: Images.laughing,
      ),
      const ActionItemEntity(
        group: ActionGroup.laughing,
        name: 'Laughing1',
        dificulty: 1,
        imagePath: Images.laughing2,
      ),
      const ActionItemEntity(
        group: ActionGroup.reading,
        name: 'Reading',
        dificulty: 1,
        imagePath: Images.reading,
      ),
      const ActionItemEntity(
        group: ActionGroup.reading,
        name: 'Reading1',
        dificulty: 1,
        imagePath: Images.reading1,
      ),
      const ActionItemEntity(
        group: ActionGroup.reading,
        name: 'Reading2',
        dificulty: 1,
        imagePath: Images.reading2,
      ),
      const ActionItemEntity(
        group: ActionGroup.sleeping,
        name: 'Sleeping',
        dificulty: 1,
        imagePath: Images.sleeping,
      ),
      const ActionItemEntity(
        group: ActionGroup.sleeping,
        name: 'Sleeping1',
        dificulty: 1,
        imagePath: Images.sleeping1,
      ),
      const ActionItemEntity(
        group: ActionGroup.takingShower,
        name: 'Taking shower',
        dificulty: 1,
        imagePath: Images.takingShower,
      ),
      const ActionItemEntity(
        group: ActionGroup.takingShower,
        name: 'Taking shower1',
        dificulty: 1,
        imagePath: Images.takingShower1,
      ),
      const ActionItemEntity(
        group: ActionGroup.takingShower,
        name: 'Taking shower2',
        dificulty: 1,
        imagePath: Images.takingShower2,
      ),
      const ActionItemEntity(
        group: ActionGroup.washingHands,
        name: 'Washing hands',
        dificulty: 1,
        imagePath: Images.washingHands,
      ),
      const ActionItemEntity(
        group: ActionGroup.washingHands,
        name: 'Washing hands1',
        dificulty: 1,
        imagePath: Images.washingHands1,
      ),
      const ActionItemEntity(
        group: ActionGroup.washingHands,
        name: 'Washing hands2',
        dificulty: 1,
        imagePath: Images.washingHands2,
      ),
      const ActionItemEntity(
        group: ActionGroup.watchingTv,
        name: 'Watching TV',
        dificulty: 1,
        imagePath: Images.watchingTv,
      ),
      const ActionItemEntity(
        group: ActionGroup.watchingTv,
        name: 'Watching TV1',
        dificulty: 1,
        imagePath: Images.watchingTv1,
      ),
    ];
  }

  @override
  Future<List<ActionItemEntity>> getItemsByDificulty(int dificulty) {
    // TODO: implement getItemsByDificulty
    throw UnimplementedError();
  }
}
