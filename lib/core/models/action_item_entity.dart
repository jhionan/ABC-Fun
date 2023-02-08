class ActionItemEntity {
  final ActionGroup group;
  final String name;
  final String imagePath;
  
  const ActionItemEntity({
    required this.group,
    required this.name,
    required this.imagePath,
  });
}

enum ActionGroup {
  brushingTeeth,
  combingHair,
  drinkingWater,
  eating,
  laughing,
  reading,
  running,
  sleeping,
  takingShower,
  washingHands,
  watchingTv,
}
