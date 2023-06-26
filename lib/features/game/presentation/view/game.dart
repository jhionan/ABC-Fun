import 'package:aba/core/actions_audio.dart';
import 'package:aba/core/providers/providers.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/features/game/domain/models/action_item_entity.dart';
import 'package:aba/features/game/presentation/bloc/game_bloc.dart';
import 'package:aba/features/widgets/background_widget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameInitial) {
              Future.microtask(() => context.read<GameBloc>().add(GameEventRestart()));
              return const Center(child: Text('Initial'));
            }
            if (state is GameVictory) {
              Future.delayed(const Duration(milliseconds: 1000))
                  .then((value) => context.read<GameBloc>().add(GameEventRestart()));
              return Container(color: Colors.green.shade200, child: const Center(child: Text('Victory')));
            }
            if (state is GameWrongAnswer) {
              Future.delayed(const Duration(milliseconds: 1000))
                  .then((value) => context.read<GameBloc>().add(GameEventRestart()));
              return Container(color: Colors.yellow.shade200, child: const Center(child: Text('Wrong Answer')));
            }
            if (state is GameOver) {
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
              Future.microtask(() =>  _readAloud(context, state.correctAnswer));
              return BackgroundWidget(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _readAloud(context, state.correctAnswer),
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(context.dimensions.vMargin),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.play_circle_outline_sharp,
                              size: 32,
                            ),
                            SizedBox(
                              width: context.dimensions.hMargin / 2,
                            ),
                            Text(
                              state.correctAnswer.actionName(context),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: LayoutBuilder(builder: (context, contraints) {
                        return GridView(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1, mainAxisExtent: contraints.maxHeight / 3),
                          physics: const NeverScrollableScrollPhysics(),
                          children: state.items.map((e) {
                            return GestureDetector(
                              onTap: () => context.read<GameBloc>().add(GameEventOnItemTapped(item: e)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image.asset(e.imagePath, fit: BoxFit.contain)),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    ),
                  ],
                ),
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

  void _readAloud(BuildContext context, ActionItemEntity action) {
    ActionAudio audioPathProvider = provider.read<ActionAudio>(Providers.actionAudio);
    String audioPath = audioPathProvider.audioPathOrEmpty(action, context);
    AudioPlayer audioPlayer = provider.read<AudioPlayer>(Providers.audioPlayer);
    if (audioPath.isNotEmpty && action.group != ActionGroup.custom) {
      audioPlayer.play(AssetSource(audioPath.replaceAll('assets/', '')));
    }
  }
}
