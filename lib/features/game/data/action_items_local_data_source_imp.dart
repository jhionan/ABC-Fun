import 'package:aba/core/images.dart';
import 'package:aba/features/game/domain/action_items_repository.dart';
import 'package:aba/features/game/domain/models/action_item_entity.dart';

class ActionItemsLocalDataSourceImp implements ActionItemsRepository {
  @override
  Future<List<ActionItemEntity>> getAllItems() async {
    return <ActionItemEntity>[
    //   const ActionItemEntity(
    //     group: ActionGroup.brushingTeeth,
    //     name: 'Brushing teeth',
    //     dificulty: 1,
    //     imagePath: Images.brushingTeeth,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.brushingTeeth,
    //     name: 'Brushing teeth1',
    //     dificulty: 1,
    //     imagePath: Images.brushingTeeth1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.brushingTeeth,
    //     name: 'Brushing teeth2',
    //     dificulty: 1,
    //     imagePath: Images.brushingTeeth2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.combingHair,
    //     name: 'Combing hair',
    //     dificulty: 1,
    //     imagePath: Images.combingHair,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.combingHair,
    //     name: 'Combing hair1',
    //     dificulty: 1,
    //     imagePath: Images.combingHair1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.combingHair,
    //     name: 'Combing hair2',
    //     dificulty: 1,
    //     imagePath: Images.combingHair2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.drinkingWater,
    //     name: 'Drinking water',
    //     dificulty: 1,
    //     imagePath: Images.drinkingWater,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.drinkingWater,
    //     name: 'Drinking water1',
    //     dificulty: 1,
    //     imagePath: Images.drinkingWater1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.drinkingWater,
    //     name: 'Drinking water2',
    //     dificulty: 1,
    //     imagePath: Images.drinkingWater2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.eating,
    //     name: 'Eating',
    //     dificulty: 1,
    //     imagePath: Images.eating,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.eating,
    //     name: 'Eating1',
    //     dificulty: 1,
    //     imagePath: Images.eating1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.eating,
    //     name: 'Eating2',
    //     dificulty: 1,
    //     imagePath: Images.eating2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.laughing,
    //     name: 'Laughing',
    //     dificulty: 1,
    //     imagePath: Images.laughing,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.laughing,
    //     name: 'Laughing1',
    //     dificulty: 1,
    //     imagePath: Images.laughing2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.reading,
    //     name: 'Reading',
    //     dificulty: 1,
    //     imagePath: Images.reading,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.reading,
    //     name: 'Reading1',
    //     dificulty: 1,
    //     imagePath: Images.reading1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.reading,
    //     name: 'Reading2',
    //     dificulty: 1,
    //     imagePath: Images.reading2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.sleeping,
    //     name: 'Sleeping',
    //     dificulty: 1,
    //     imagePath: Images.sleeping,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.sleeping,
    //     name: 'Sleeping1',
    //     dificulty: 1,
    //     imagePath: Images.sleeping1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.takingShower,
    //     name: 'Taking shower',
    //     dificulty: 1,
    //     imagePath: Images.takingShower,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.takingShower,
    //     name: 'Taking shower1',
    //     dificulty: 1,
    //     imagePath: Images.takingShower1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.takingShower,
    //     name: 'Taking shower2',
    //     dificulty: 1,
    //     imagePath: Images.takingShower2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.washingHands,
    //     name: 'Washing hands',
    //     dificulty: 1,
    //     imagePath: Images.washingHands,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.washingHands,
    //     name: 'Washing hands1',
    //     dificulty: 1,
    //     imagePath: Images.washingHands1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.washingHands,
    //     name: 'Washing hands2',
    //     dificulty: 1,
    //     imagePath: Images.washingHands2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.watchingTv,
    //     name: 'Watching TV',
    //     dificulty: 1,
    //     imagePath: Images.watchingTv,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.watchingTv,
    //     name: 'Watching TV1',
    //     dificulty: 1,
    //     imagePath: Images.watchingTv1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.climbing,
    //     name: 'Clinbing',
    //     dificulty: 1,
    //     imagePath: Images.climbing,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.climbing,
    //     name: 'Clinbing1',
    //     dificulty: 1,
    //     imagePath: Images.climbing1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.climbing,
    //     name: 'Clinbing2',
    //     dificulty: 1,
    //     imagePath: Images.climbing2,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.coloring,
    //     name: 'Coloring',
    //     dificulty: 1,
    //     imagePath: Images.coloring,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.coloring,
    //     name: 'Coloring1',
    //     dificulty: 1,
    //     imagePath: Images.coloring1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.coloring,
    //     name: 'Coloring2',
    //     dificulty: 1,
    //     imagePath: Images.coloring2,
    //   ),
    //   //crying
    //   const ActionItemEntity(
    //     group: ActionGroup.crying,
    //     name: 'Crying',
    //     dificulty: 1,
    //     imagePath: Images.crying,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.crying,
    //     name: 'Crying1',
    //     dificulty: 1,
    //     imagePath: Images.crying1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.crying,
    //     name: 'Crying2',
    //     dificulty: 1,
    //     imagePath: Images.crying2,
    //   ),
    //   //greeting
    //   const ActionItemEntity(
    //     group: ActionGroup.greeting,
    //     name: 'Greeting',
    //     dificulty: 1,
    //     imagePath: Images.greeting,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.greeting,
    //     name: 'Greeting1',
    //     dificulty: 1,
    //     imagePath: Images.greeting1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.greeting,
    //     name: 'Greeting2',
    //     dificulty: 1,
    //     imagePath: Images.greeting2,
    //   ),
    //   //hugging
    //   const ActionItemEntity(
    //     group: ActionGroup.hugging,
    //     name: 'Hugging',
    //     dificulty: 1,
    //     imagePath: Images.hugging,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.hugging,
    //     name: 'Hugging1',
    //     dificulty: 1,
    //     imagePath: Images.hugging1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.hugging,
    //     name: 'Hugging2',
    //     dificulty: 1,
    //     imagePath: Images.hugging2,
    //   ),
    //   //jumping
    //   const ActionItemEntity(
    //     group: ActionGroup.jumping,
    //     name: 'Jumping',
    //     dificulty: 1,
    //     imagePath: Images.jumping,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.jumping,
    //     name: 'Jumping1',
    //     dificulty: 1,
    //     imagePath: Images.jumping1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.jumping,
    //     name: 'Jumping2',
    //     dificulty: 1,
    //     imagePath: Images.jumping2,
    //   ),
    //   //playing
    //   const ActionItemEntity(
    //     group: ActionGroup.playing,
    //     name: 'Playing',
    //     dificulty: 1,
    //     imagePath: Images.playing,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.playing,
    //     name: 'Playing1',
    //     dificulty: 1,
    //     imagePath: Images.playing1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.playing,
    //     name: 'Playing2',
    //     dificulty: 1,
    //     imagePath: Images.playing2,
    //   ),
    //   //petting
    //   const ActionItemEntity(
    //     group: ActionGroup.petting,
    //     name: 'Petting',
    //     dificulty: 1,
    //     imagePath: Images.petting,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.petting,
    //     name: 'Petting1',
    //     dificulty: 1,
    //     imagePath: Images.petting1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.petting,
    //     name: 'Petting2',
    //     dificulty: 1,
    //     imagePath: Images.petting2,
    //   ),
    //   //screaming
    //   const ActionItemEntity(
    //     group: ActionGroup.screaming,
    //     name: 'Screaming',
    //     dificulty: 1,
    //     imagePath: Images.screaming,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.screaming,
    //     name: 'Screaming1',
    //     dificulty: 1,
    //     imagePath: Images.screaming1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.screaming,
    //     name: 'Screaming2',
    //     dificulty: 1,
    //     imagePath: Images.screaming2,
    //   ),
    //   //sitting
    //   const ActionItemEntity(
    //     group: ActionGroup.sitting,
    //     name: 'Sitting',
    //     dificulty: 1,
    //     imagePath: Images.sitting,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.sitting,
    //     name: 'Sitting1',
    //     dificulty: 1,
    //     imagePath: Images.sitting1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.sitting,
    //     name: 'Sitting2',
    //     dificulty: 1,
    //     imagePath: Images.sitting2,
    //   ),
    //   //singing
    //   const ActionItemEntity(
    //     group: ActionGroup.singing,
    //     name: 'Singing',
    //     dificulty: 1,
    //     imagePath: Images.singing,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.singing,
    //     name: 'Singing1',
    //     dificulty: 1,
    //     imagePath: Images.singing1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.singing,
    //     name: 'Singing2',
    //     dificulty: 1,
    //     imagePath: Images.singing2,
    //   ),
    //   //studying
    //   const ActionItemEntity(
    //     group: ActionGroup.studying,
    //     name: 'Studying',
    //     dificulty: 1,
    //     imagePath: Images.studying,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.studying,
    //     name: 'Studying1',
    //     dificulty: 1,
    //     imagePath: Images.studying1,
    //   ),
    //   const ActionItemEntity(
    //     group: ActionGroup.studying,
    //     name: 'Studying2',
    //     dificulty: 1,
    //     imagePath: Images.studying2,
    //   ),
    ];
  }

  @override
  Future<List<ActionItemEntity>> getItemsByDificulty(int dificulty) {
    // TODO: implement getItemsByDificulty
    throw UnimplementedError();
  }
}
