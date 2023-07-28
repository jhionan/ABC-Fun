import 'package:abc_fun/core/domain/action_items_repository.dart';
import 'package:abc_fun/core/providers/providers.dart';
import 'package:abc_fun/features/game/domain/game_session_repository.dart';
import 'package:abc_fun/features/game/presentation/bloc/game_bloc.dart';
import 'package:abc_fun/features/game/presentation/view/game_page.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GameProvider extends StatelessWidget {
  const GameProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      create: (context) => GameBloc(
        actionEntityRepository: provider.read<ActionItemsRepository>(
          Providers.actionItemsRepository,
        ),
        gameSessionRepository: provider.read<GameSessionRepository>(
          Providers.gameSessionRepository,
        ),
        settingsRepository: provider.read<SettingsRepository>(Providers.settingsRepository),
      ),
      child: const GamePage(),
    );
  }
}
