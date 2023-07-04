import 'package:abc_fun/core/domain/view/widgets/abc_button.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_scaffold.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_card.dart';
import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/navigation/abc_router.gr.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/features/account_sync/presentation/bloc/account_sync_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSyncPage extends StatelessWidget {
  const AccountSyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbcScaffold(
      adaptativeBuilder: (context, type, constraints) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AbcButton.backButton(
                context: context,
                onPressed: () => context.router.replace(const DashboardRoute()),
              ),
            ),
            SizedBox(
              height: context.dimensions.vMargin * 2,
            ),
            BlocBuilder<AccountSyncBloc, AccountSyncState>(
              builder: (context, state) {
                late Widget childBellow = switch (state) {
                  AccountSyncLoadingState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  AccountSyncDisconnectedState() => const _DisconnectedAccount(),
                  AccountSyncLoggedInState() => _ConnectedAccount(state),
                };

                return AbcTitleCard(
                  title: context.intl.syncAccountPageTitle,
                  description: '',
                  descriptionStyle: Theme.of(context).textTheme.bodyLarge,
                  imageUrl: Images.accountSync,
                  childBellow: childBellow,
                );
              },
            )
          ],
        );
      },
    );
  }
}

class _DisconnectedAccount extends StatelessWidget {
  const _DisconnectedAccount();

  @override
  Widget build(BuildContext context) {
    AccountSyncBloc bloc = BlocProvider.of<AccountSyncBloc>(context);
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(context.intl.accountSyncPageSyncAccount)),
            Image.asset(Images.googleIcon, width: 40, height: 40, fit: BoxFit.contain),
          ],
        ),
        onPressed: () => _connectGoogleAccount(context, bloc),
      ),
    );
  }

  _connectGoogleAccount(BuildContext context, AccountSyncBloc bloc) {
    bloc.add(AccountSyncEventLoginEvent());
  }
}

class _ConnectedAccount extends StatelessWidget {
  const _ConnectedAccount(this.state);
  final AccountSyncLoggedInState state;

  @override
  Widget build(BuildContext context) {
    AccountSyncBloc bloc = BlocProvider.of<AccountSyncBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Text(state.email)),
                Image.asset(Images.googleIcon, width: 40, height: 40, fit: BoxFit.contain),
                const SizedBox(width: 4,),
                AbcButton.secondaryRed(text: context.intl.buttonLogout),
              ],
            ),
            onPressed: () => _logout(bloc),
          ),
        ),
        SizedBox(height: context.dimensions.vMargin,),
        TextButton(
          child: Text(context.intl.buttonLogoutAllDevices),
          onPressed: () => _logoutAll(bloc),
        )
      ],
    );
  }

  _logout(AccountSyncBloc bloc) {
    bloc.add(AccountSyncLogoutEvent());
  }

  _logoutAll(AccountSyncBloc bloc) {
    bloc.add(AccountSyncLogoutAllDevicesEvent());
  }
}
