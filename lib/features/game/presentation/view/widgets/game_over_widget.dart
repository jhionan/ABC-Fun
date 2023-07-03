import 'dart:math';

import 'package:abc_fun/core/domain/view/widgets/abc_button.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_card.dart';
import 'package:abc_fun/core/domain/view/widgets/adaptative_screen_builder.dart';
import 'package:abc_fun/core/domain/view/widgets/background_widget.dart';
import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/features/game/presentation/bloc/game_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: EdgeInsets.all(context.dimensions.hMargin * 2),
        child: AdaptativeScreenBuilder(builder: (context, type, constraints) {
          double maxImageWidth = min(constraints.maxWidth * 0.25, 200);
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              Center(
                child: AbcCard(
                  padding: EdgeInsets.all(context.dimensions.hMargin),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Text(
                        context.intl.gameOverTitle,
                        textAlign: TextAlign.center,
                        style: context.textTheme.displayMedium?.copyWith(
                          color: AbcColors.primary,
                        ),
                      ),
                      SizedBox(
                        height: context.dimensions.vMargin * 2,
                      ),
                      IconButton.filledTonal(
                        icon: const Icon(
                          Icons.replay,
                          size: 48,
                        ),
                        onPressed: () => _playAgain(context),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      AbcButton.secondary(
                        text: context.intl.buttonPlayAgain,
                        onPressed: () => _playAgain(context),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 2 * context.dimensions.hMargin,
                top: (constraints.maxHeight / 4) - maxImageWidth,
                child: Image.asset(
                  Images.totalAverangeSuccessResults,
                  width: maxImageWidth,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                right: 2 * context.dimensions.hMargin,
                bottom: (constraints.maxHeight / 4) - maxImageWidth / 2,
                child: Image.asset(
                  Images.totalChallengesResults,
                  width: maxImageWidth,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: AbcButton.backButton(
                  context: context,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  void _playAgain(BuildContext context) {
    BlocProvider.of<GameBloc>(context).add(GameRestartStageEvent());
  }
}
