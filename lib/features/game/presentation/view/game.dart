import 'package:aba/features/game/domain/models/action_item_entity.dart';
import 'package:aba/features/game/presentation/bloc/game_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is GameInitial) {
            Future.microtask(() => context.read<GameBloc>().add(GameEventRestart()));
            return const Center(child: Text('Initial'));
          }
          if (state is GameVictory) {
            Future.delayed(const Duration(milliseconds: 500))
                .then((value) => context.read<GameBloc>().add(GameEventRestart()));
            return Container(color: Colors.green.shade200, child: const Center(child: Text('Victory')));
          }
          if (state is GameWrongAnswer) {
            Future.delayed(const Duration(milliseconds: 500))
                .then((value) => context.read<GameBloc>().add(GameEventRestart()));
            return Container(color: Colors.yellow.shade200, child: const Center(child: Text('Wrong Answer')));
          }
          if (state is GameOver) {
            return Container(
                color: Colors.red.shade200,
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
                      child: Text(AppLocalizations.of(context)!.menuTitle),
                    )
                  ],
                ));
          }
          if (state is GameRunning) {
            return Column(
              children: [
                Text(
                  state.correctAnswer.group.actionName(context),
                  style: const TextStyle(fontSize: 32),
                ),
                Expanded(
                  child: LayoutBuilder(builder: (context, contraints) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 2, mainAxisExtent: contraints.maxHeight / 3),
                      physics: const NeverScrollableScrollPhysics(),
                      children: state.items.map((e) {
                        return GestureDetector(
                          onTap: () => context.read<GameBloc>().add(GameEventOnItemTapped(item: e)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(e.imagePath, fit: BoxFit.fill)),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  _navigateToMenu(BuildContext context) {
    Navigator.of(context).pop();
  }
}
