import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return group.hashCode ^ name.hashCode ^ imagePath.hashCode ^ dificulty.hashCode;
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
  climbing,
  crying,
  greeting,
  hugging,
  jumping,
  petting,
  playing,
  screaming,
  sitting,
  studying,
  singing,
  coloring,
}

extension ActionGroupNameEx on ActionGroup {
  String actionName(BuildContext context) {
    switch (this) {
      case ActionGroup.brushingTeeth:
        return AppLocalizations.of(context)!.brushingTeeth;
      case ActionGroup.combingHair:
        return AppLocalizations.of(context)!.combingHair;
      case ActionGroup.drinkingWater:
        return AppLocalizations.of(context)!.drinkingWater;
      case ActionGroup.eating:
        return AppLocalizations.of(context)!.eating;
      case ActionGroup.laughing:
        return AppLocalizations.of(context)!.laughing;
      case ActionGroup.reading:
        return AppLocalizations.of(context)!.reading;
      case ActionGroup.running:
        return AppLocalizations.of(context)!.running;
      case ActionGroup.sleeping:
        return AppLocalizations.of(context)!.sleeping;
      case ActionGroup.takingShower:
        return AppLocalizations.of(context)!.takingShower;
      case ActionGroup.washingHands:
        return AppLocalizations.of(context)!.washingHands;
      case ActionGroup.watchingTv:
        return AppLocalizations.of(context)!.watchingTv;
      case ActionGroup.climbing:
        return AppLocalizations.of(context)!.climbing;
      case ActionGroup.crying:
        return AppLocalizations.of(context)!.crying;
      case ActionGroup.greeting:
        return AppLocalizations.of(context)!.greeting;
      case ActionGroup.hugging:
        return AppLocalizations.of(context)!.hugging;
      case ActionGroup.jumping:
        return AppLocalizations.of(context)!.jumping;
      case ActionGroup.petting:
        return AppLocalizations.of(context)!.petting;
      case ActionGroup.playing:
        return AppLocalizations.of(context)!.playing;
      case ActionGroup.screaming:
        return AppLocalizations.of(context)!.screaming;
      case ActionGroup.sitting:
        return AppLocalizations.of(context)!.sitting;
      case ActionGroup.studying:
        return AppLocalizations.of(context)!.studying;
      case ActionGroup.singing:
        return AppLocalizations.of(context)!.singing;
      case ActionGroup.coloring:
        return AppLocalizations.of(context)!.coloring;
    }
  }
}
