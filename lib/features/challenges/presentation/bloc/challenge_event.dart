part of 'challenge_bloc.dart';

@immutable
sealed class ChallengeEvent {
  const ChallengeEvent();
}

class ChallengeInitialEvent extends ChallengeEvent {
  const ChallengeInitialEvent();
}

class ChallengeLoadedEvent extends ChallengeEvent {
  const ChallengeLoadedEvent();
}

class ChallengeToggleActionEvent extends ChallengeEvent {
  const ChallengeToggleActionEvent(this.actionName);
  final String actionName;
}

class CreateNewChallengeNewActionDataEvent extends ChallengeEvent {
  const CreateNewChallengeNewActionDataEvent({this.imagePaths, this.title, this.audioPath});
  final List<String>? imagePaths;
  final String? title;
  final String? audioPath;
}

class CreateNewChallengeSaveEvent extends ChallengeEvent {
  const CreateNewChallengeSaveEvent();
}

class CreateNewChallengeCompleteEvent extends ChallengeEvent {
  const CreateNewChallengeCompleteEvent();
}