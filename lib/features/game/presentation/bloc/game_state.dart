part of 'game_bloc.dart';

@immutable
sealed class GameState {}

class GameLoading extends GameState {}

class GameRunning extends GameState {
  final List<ActionItemEntity> items;
  final ActionItemEntity correctAnswer;
  final int itemsCount;
  final int errorCount;
  GameRunning({required this.items, required this.correctAnswer, this.itemsCount = 6, this.errorCount = 0,});

  GameRunning.fromWrongAnswerState(GameWrongAnswer state)
      : items = state.items,
        correctAnswer = state.correctAnswer,
        itemsCount = state.itemsCount,
        errorCount = state.errorCount;

  GameRunning copyWith({
    List<ActionItemEntity>? items,
    ActionItemEntity? correctAnswer,
    int? itemsCount,
    int? errorCount,
  }) {
    return GameRunning(
      items: items ?? this.items,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      itemsCount: itemsCount ?? this.itemsCount,
      errorCount: errorCount ?? this.errorCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameRunning &&
        listEquals(other.items, items) &&
        other.correctAnswer == correctAnswer &&
        other.itemsCount == itemsCount &&
        other.errorCount == errorCount;
  }

  @override
  int get hashCode {
    return items.hashCode ^ correctAnswer.hashCode ^ itemsCount.hashCode ^ errorCount.hashCode;
  }
}

class GameWrongAnswer extends GameState {
  final List<ActionItemEntity> items;
  final ActionItemEntity correctAnswer;
  final int itemsCount;
  final int errorCount;
  

  GameWrongAnswer.fromRunningState(GameRunning state)
      : items = state.items,
        correctAnswer = state.correctAnswer,
        itemsCount = state.itemsCount + 1,
        errorCount = state.errorCount;
}

class GameOver extends GameState {
  final double scorePercentage;
  GameOver({
    required this.scorePercentage,
  });
}

class GameVictory extends GameState {
  GameVictory({this.image});
  final Uint8List? image;
}

class GameError extends GameState {}
