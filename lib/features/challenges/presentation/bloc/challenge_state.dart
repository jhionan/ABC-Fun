part of 'challenge_bloc.dart';

@immutable
sealed class ChallengeState {}

class ChallengeLoadingState extends ChallengeState {}

class ChallengeLoadedState extends ChallengeState {
  ChallengeLoadedState({
    required this.actionsGroupedByName,
  });
  final Map<String, List<ActionItemDto>> actionsGroupedByName;
}

class ChallengeErrorState extends ChallengeState {
  ChallengeErrorState({
    required this.actionsGroupedByName,
  });
  final Map<String, List<ActionItemDto>> actionsGroupedByName;
}

class ChallengeNewActionDataState extends ChallengeState {
  ChallengeNewActionDataState({
    this.imagePaths = const [],
    required this.title,
    required this.audioPath,
    required this.errorNeedTitle,
  });
  final List<String> imagePaths;
  final String title;
  final String? audioPath;
  final bool errorNeedTitle;
}

class ChallengeNewActionSavedState extends ChallengeState {}
