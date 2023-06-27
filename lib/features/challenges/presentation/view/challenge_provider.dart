import 'package:aba/core/db/daos/action_custom_item_dao.dart';
import 'package:aba/core/providers/providers.dart';
import 'package:aba/features/challenges/presentation/bloc/challenge_bloc.dart';
import 'package:aba/features/game/data/action_items_default_data_source_imp.dart';
import 'package:aba/features/game/data/action_items_local_data_source_imp.dart';
import 'package:aba/features/game/data/action_items_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

@RoutePage(name: 'ChallengeProviderRoute')
class ChallengeProvider extends StatelessWidget implements AutoRouteWrapper {
  const ChallengeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ChallengeBloc(
          actionItemsRepository: ActionItemsRepositoryImp(
        defaultDataSource: ActionItemsDefaultDataSourceImp(),
        localDataSource: ActionItemsLocalDataSourceImp(
          ActionCustomItemDao(
            provider.read<Future<Isar>>(Providers.db),
          ),
        ),
      )),
      child: this,
    );
  }
}
