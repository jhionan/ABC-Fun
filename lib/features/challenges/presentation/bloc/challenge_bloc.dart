import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  ChallengeBloc() : super(ChallengeLoading()) {
    on<ChallengeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
