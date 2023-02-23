class ActionItemEntity {
  final ActionGroup group;
  final String name;
  final String imagePath;
  final int dificulty;
  
  const ActionItemEntity({
    required this.group,
    required this.name,
    required this.imagePath,
    required this.dificulty,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ActionItemEntity &&
      other.group == group &&
      other.name == name &&
      other.imagePath == imagePath &&
      other.dificulty == dificulty;
  }

  @override
  int get hashCode {
    return group.hashCode ^
      name.hashCode ^
      imagePath.hashCode ^
      dificulty.hashCode;
  }
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
