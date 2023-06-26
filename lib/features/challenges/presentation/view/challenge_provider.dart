import 'package:aba/features/challenges/presentation/bloc/challenge_bloc.dart';
import 'package:aba/features/challenges/presentation/view/challenge.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ChallengeProvider extends StatelessWidget {
  const ChallengeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ChallengeBloc(),
      child: const Challenge(),
    );
  }
}