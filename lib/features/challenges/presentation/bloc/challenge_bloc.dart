import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  ChallengeBloc() : super(ChallengeLoading()) {
    on<ChallengeEvent>(handleEvent);
  }

  FutureOr<void> handleEvent(ChallengeEvent event, Emitter<ChallengeState> emit) async {
    return null;
  }
}
