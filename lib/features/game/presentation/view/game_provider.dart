import 'package:aba/features/game/data/action_items_local_data_source_imp.dart';
import 'package:aba/features/game/data/action_items_repository.dart';
import 'package:aba/features/game/presentation/bloc/game_bloc.dart';
import 'package:aba/features/game/presentation/view/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameProvider extends StatelessWidget {
  const GameProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      create: (context) =>
          GameBloc(repository: ActionItemsRepositoryImp(localDataSource: ActionItemsLocalDataSourceImp())),
      child: const Game(),
    );
  }
}
