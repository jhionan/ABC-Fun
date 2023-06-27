import 'package:aba/features/challenges/presentation/bloc/challenge_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreateNewChallengePage extends StatelessWidget {
  const CreateNewChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    ChallengeBloc bloc = context.read<ChallengeBloc>();
    return const Placeholder();
  }
}
