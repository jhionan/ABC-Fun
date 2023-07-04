part of 'account_sync_bloc.dart';

@immutable
abstract class AccountSyncEvent {}

class AccountSyncEventLoginEvent extends AccountSyncEvent {}

class AccountSyncLogoutEvent extends AccountSyncEvent {}

class AccountSyncLogoutAllDevicesEvent extends AccountSyncEvent {}

class AccountSyncLoggedEvent extends AccountSyncEvent {
  AccountSyncLoggedEvent({
    required this.user,
  });

  final User user;
}
