part of 'challenge_bloc.dart';

@immutable
sealed class ChallengeEvent {}

class ChallengeInitialEvent extends ChallengeEvent {}

class ChallengeLoadedEvent extends ChallengeEvent {}

class ChallengeToggleActionEvent extends ChallengeEvent {
  ChallengeToggleActionEvent(this.actionName);
  final String actionName;
}
