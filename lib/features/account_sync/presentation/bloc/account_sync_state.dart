part of 'account_sync_bloc.dart';

sealed class AccountSyncState {
  const AccountSyncState();
}

class AccountSyncDisconnectedState extends AccountSyncState {
  const AccountSyncDisconnectedState();
}

class AccountSyncLoadingState extends AccountSyncState {
  const AccountSyncLoadingState();
}

class AccountSyncLoggedInState extends AccountSyncState {
  const AccountSyncLoggedInState({
    required this.email,
    required this.name,
  });

  final String email;
  final String name;
}
