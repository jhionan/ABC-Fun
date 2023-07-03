import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/features/game/presentation/bloc/game_bloc.dart';
import 'package:abc_fun/features/game/presentation/view/widgets/game_over_widget.dart';
import 'package:abc_fun/features/game/presentation/view/widgets/game_running_widget.dart';
import 'package:abc_fun/features/game/presentation/view/widgets/game_victory_widget.dart';
import 'package:abc_fun/features/game/presentation/view/widgets/game_wrong_answer_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameLoading) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  SizedBox(
                    height: context.dimensions.vMargin,
                  ),
                  Text(context.intl.loading),
                ],
              ));
            }
            if (state is GameVictory) {
              Future.delayed(const Duration(milliseconds: 1500))
                  .then((value) => context.read<GameBloc>().add(GameRestartStageEvent()));
              return GameVictoryWidget(
                imageData: state.image,
              );
            }
            if (state is GameError) {
              Future.delayed(const Duration(milliseconds: 3000)).then((value) => context.router.popUntilRoot());
              return Container(color: Colors.red.shade700, child: Center(child: Text(context.intl.gameError)));
            }
            if (state is GameWrongAnswer) {
              Future.delayed(const Duration(milliseconds: 2000))
                  .then((value) => context.read<GameBloc>().add(GameRestartStageEvent()));
              return const GameWrongAnswerWidget();
            }
            if (state is GameOver) {
              // Future.delayed(const Duration(milliseconds: 2000)).then((value) => context.router.popUntilRoot());
              return const GameOverWidget();
            }
            if (state is GameRunning) {
              return GameRunningWidget(
                state: state,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _navigateToMenu(BuildContext context) {
    Navigator.of(context).pop();
  }
}
