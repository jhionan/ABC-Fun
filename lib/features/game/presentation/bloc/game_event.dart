part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GameEventOnItemTapped extends GameEvent {
  final ActionItemEntity item;
  GameEventOnItemTapped({
    required this.item,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GameEventOnItemTapped &&
      other.item == item;
  }

  @override
  int get hashCode => item.hashCode;
}

class GameEventRestart extends GameEvent {}
