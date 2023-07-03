import 'package:abc_fun/core/db/daos/settings_dao.dart';
import 'package:abc_fun/core/db/db_imp/isar_db_settings_imp.dart';
import 'package:abc_fun/core/providers/providers.dart';
import 'package:abc_fun/features/settings/data/settings_default_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_local_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_repository_imp.dart';
import 'package:abc_fun/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:abc_fun/features/settings/presentation/view/settings_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

@RoutePage()
class SettingsProvider extends StatelessWidget {
  const SettingsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
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
      child: const SettingsPage(),
    );
  }
}
