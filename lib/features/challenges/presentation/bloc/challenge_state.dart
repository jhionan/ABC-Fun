part of 'challenge_bloc.dart';

@immutable
sealed class ChallengeState {}

class ChallengeLoadingState extends ChallengeState {}

class ChallengeLoadedState extends ChallengeState {
  ChallengeLoadedState({
    required this.actionsGroupedByName,
  });
  final Map<String, List<ActionCustomItemEntity>> actionsGroupedByName;
}

class ChallengeErrorState extends ChallengeState {
  ChallengeErrorState({
    required this.actionsGroupedByName,
  });
  final Map<String, List<ActionCustomItemEntity>> actionsGroupedByName;
}

class ChallengeNewActionDataState extends ChallengeState {
  ChallengeNewActionDataState({
    required this.imagePaths,
    required this.title,
    required this.audioPath,
  });
  final List<String>? imagePaths;
  final String title;
  final String? audioPath;
}
