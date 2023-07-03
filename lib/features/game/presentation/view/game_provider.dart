import 'package:abc_fun/core/db/daos/action_custom_item_dao.dart';
import 'package:abc_fun/core/db/daos/settings_dao.dart';
import 'package:abc_fun/core/db/db_imp/isar_db_action_custom_item_imp.dart';
import 'package:abc_fun/core/db/db_imp/isar_db_settings_imp.dart';
import 'package:abc_fun/core/providers/providers.dart';
import 'package:abc_fun/features/game/data/action_items_default_data_source.dart';
import 'package:abc_fun/features/game/data/action_items_local_data_source.dart';
import 'package:abc_fun/features/game/data/action_items_repository.dart';
import 'package:abc_fun/features/game/presentation/bloc/game_bloc.dart';
import 'package:abc_fun/features/game/presentation/view/game_page.dart';
import 'package:abc_fun/features/settings/data/settings_default_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_local_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_repository_imp.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

@RoutePage()
class GameProvider extends StatelessWidget {
  const GameProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      create: (context) => GameBloc(
        actionEntityRepository: ActionItemsRepositoryImp(
          defaultDataSource: ActionItemsDefaultDataSource(),
          localDataSource: ActionItemsLocalDataSource(
            ActionCustomItemDao(
              IsarDbActionCustomItemImp(provider.read<Future<Isar>>(Providers.isarDb)),
            ),
          ),
        ),
        settingsRepository: SettingsRepositoryImp(
          settingsDefaultDataSource: SettingsDefaultDataSource(),
          settingsLocalDataSource: SettingsLocalDataSource(
            settingsDao: SettingsDao(
              IsarDbSettingsImp(
                provider.read<Future<Isar>>(Providers.isarDb),
              ),
            ),
          ),
        ),
      ),
      child: const GamePage(),
    );
  }
}
