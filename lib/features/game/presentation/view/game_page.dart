import 'package:aba/core/actions_audio.dart';
import 'package:aba/core/providers/providers.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/domain/models/action_item_entity.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/features/game/presentation/bloc/game_bloc.dart';
import 'package:aba/features/game/presentation/view/widgets/game_over_widget.dart';
import 'package:aba/features/game/presentation/view/widgets/game_running_widget.dart';
import 'package:aba/features/game/presentation/view/widgets/game_victory_widget.dart';
import 'package:aba/features/game/presentation/view/widgets/game_wrong_answer_widget.dart';
import 'package:aba/features/widgets/background_widget.dart';
import 'package:audioplayers/audioplayers.dart';
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
                  .then((value) => context.read<GameBloc>().add(GameEventRestart()));
              return GameVictoryWidget(
                imageData: state.image,
              );
            }
            if (state is GameError) {
              Future.delayed(const Duration(milliseconds: 3000)).then((value) => context.router.popUntilRoot());
              return Container(color: Colors.red.shade700, child: Center(child: Text(context.intl.gameError)));
            }
            if (state is GameWrongAnswer) {
              Future.delayed(const Duration(milliseconds: 1000))
                  .then((value) => context.read<GameBloc>().add(GameEventRestart()));
              return const GameWrongAnswerWidget();
            }
            if (state is GameOver) {
              Future.delayed(const Duration(milliseconds: 2000)).then((value) => context.router.popUntilRoot());
              return GameOverWidget();
              return Container(
                  color: Colors.blue.shade200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Pontuação final: ${state.scorePercentage.toStringAsPrecision(4)}%'),
                      const SizedBox(
                        width: double.infinity,
                        height: 16,
                      ),
                      MaterialButton(
                        onPressed: () => _navigateToMenu(context),
                        child: Text(AppLocalizations.of(context).menuTitle),
                      )
                    ],
                  ));
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
