import 'package:abc_fun/core/actions_audio.dart';
import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:abc_fun/core/domain/view/widgets/adaptative_screen_builder.dart';
import 'package:abc_fun/core/domain/view/widgets/background_widget.dart';
import 'package:abc_fun/core/providers/providers.dart';
import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/features/game/presentation/bloc/game_bloc.dart';
import 'package:abc_fun/features/game/presentation/view/widgets/game_running_image.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameRunningWidget extends StatelessWidget {
  const GameRunningWidget({
    super.key,
    required this.state,
  });

  final GameRunning state;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        children: [
          _ActionTitle(
            gameRunningState: state,
            key: ValueKey(state.correctAnswer),
          ),
          Expanded(
            child: AdaptativeScreenBuilder(builder: (context, type, contraints) {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: type.isDesktop ? 3 : 2,
                  childAspectRatio: 1,
                  mainAxisExtent: contraints.maxHeight / (type.isDesktop ? 2 : 3),
                ),
                physics: const NeverScrollableScrollPhysics(),
                children: state.items.map((e) {
                  return GestureDetector(
                    onTap: () => context.read<GameBloc>().add(GameEventOnItemTapped(item: e)),
                    child: GameRunningImage(actionItemEntity: e),
                  );
                }).toList(),
              );
            }),
          ),
        ],
      ),
    );
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
    Future.microtask(() {
      _readAloud(context, widget.gameRunningState.correctAnswer);
    });
    return Row(
      children: [
        SizedBox(
          width: context.dimensions.hMargin,
        ),
        BackButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(AbcColors.text),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => _readAloud(context, widget.gameRunningState.correctAnswer),
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.all(context.dimensions.vMargin),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.gameRunningState.correctAnswer.group != ActionGroup.custom ||
                      (widget.gameRunningState.correctAnswer is ActionCustomItemEntity &&
                          (widget.gameRunningState.correctAnswer as ActionCustomItemEntity).audioBytes != null)) ...[
                    const Icon(
                      Icons.play_circle_outline_sharp,
                      size: 32,
                    ),
                    SizedBox(
                      width: context.dimensions.hMargin / 2,
                    ),
                  ],
                  Flexible(
                    child: Text(
                      widget.gameRunningState.correctAnswer.actionName(context),
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _readAloud(BuildContext context, ActionItemEntity action) async {
    ActionAudio audioPathProvider = provider.read<ActionAudio>(Providers.actionAudio);
    String audioPath = audioPathProvider.audioPathOrEmpty(action, context);
    if (audioPath.isNotEmpty && action.group != ActionGroup.custom) {
      audioPlayer.play(AssetSource(audioPath.replaceAll('assets/', '')));
    }
    if (action.group == ActionGroup.custom && action is ActionCustomItemEntity && action.audioBytes != null) {
      try {
        audioPlayer.play(BytesSource(Uint8List.fromList(action.audioBytes!)));
      } catch (_) {}
    }
  }
}
