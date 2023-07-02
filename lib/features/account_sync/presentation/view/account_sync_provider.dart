import 'package:aba/features/account_sync/presentation/bloc/account_sync_bloc.dart';
import 'package:aba/features/account_sync/presentation/view/account_sync_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AccountSyncProvider extends StatelessWidget {
  const AccountSyncProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountSyncBloc(),
      child: const AccountSyncPage(),
    );
  }
}