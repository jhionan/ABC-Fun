import 'package:aba/core/actions_audio.dart';
import 'package:aba/core/providers/providers.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/domain/models/action_item_entity.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/features/game/presentation/bloc/game_bloc.dart';
import 'package:aba/features/widgets/background_widget.dart';
import 'package:audioplayers/audioplayers.dart';
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
              Future.delayed(const Duration(milliseconds: 1000))
                  .then((value) => context.read<GameBloc>().add(GameEventRestart()));
              return Container(color: Colors.green.shade200, child: const Center(child: Text('Victory')));
            }
            if (state is GameError) {
              return Container(color: Colors.red.shade700, child: Center(child: Text(context.intl.gameError)));
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
              return BackgroundWidget(
                child: Column(
                  children: [
                    _ActionTitle(
                      gameRunningState: state,
                      key: ValueKey(state.correctAnswer),
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
}

class _ActionTitle extends StatefulWidget {
  const _ActionTitle({
    super.key,
    required this.gameRunningState,
  });

  final GameRunning gameRunningState;

  @override
  State<_ActionTitle> createState() => _ActionTitleState();
}

class _ActionTitleState extends State<_ActionTitle> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => _readAloud(context, widget.gameRunningState.correctAnswer));
    return InkWell(
      onTap: () => _readAloud(context, widget.gameRunningState.correctAnswer),
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
            Flexible(
              child: Text(
                widget.gameRunningState.correctAnswer.actionName(context),
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _readAloud(BuildContext context, ActionItemEntity action) {
    ActionAudio audioPathProvider = provider.read<ActionAudio>(Providers.actionAudio);
    String audioPath = audioPathProvider.audioPathOrEmpty(action, context);
    if (audioPath.isNotEmpty && action.group != ActionGroup.custom) {
      audioPlayer.play(AssetSource(audioPath.replaceAll('assets/', '')));
    }
  }
}
