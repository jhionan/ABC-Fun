import 'dart:async';

import 'package:abc_fun/core/data/appwrite_client.dart';
import 'package:abc_fun/core/domain/repositories/user_repository.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'account_sync_event.dart';
part 'account_sync_state.dart';

class AccountSyncBloc extends Bloc<AccountSyncEvent, AccountSyncState> {
  AccountSyncBloc({required this.userRepository}) : super(const AccountSyncLoadingState()) {
    on<AccountSyncEvent>(_handleEvent);
    _init();
  }

  final UserRepository userRepository;

  Future<FutureOr<void>> _handleEvent(AccountSyncEvent event, Emitter<AccountSyncState> emit) async {
    if (event is AccountSyncLogoutEvent) {
      _logout();
      emit(const AccountSyncDisconnectedState());
    }
    if (event is AccountSyncLogoutAllDevicesEvent) {
      _logoutAllDevices();
      emit(const AccountSyncDisconnectedState());
    }
    if (event is AccountSyncEventLoginEvent) {
      _login();
    }
    if (event is AccountSyncLoggedEvent) {
      emit(AccountSyncLoggedInState(
        email: event.user.email,
        name: event.user.name,
      ));
    }
  }

  void _logoutAllDevices() {
    userRepository.logoutAllDevices();
  }

  _init() async {
    User? user = await userRepository.getUser();
    if (user == null || !user.isLogged) {
      add(AccountSyncLogoutEvent());
      return;
    }
    if (user.isLogged) {
      add(AccountSyncLoggedEvent(user: user));
    }
  }

  Future<void> _login() async {
    User? user = await userRepository.login();
    if (user == null) {
      add(AccountSyncLogoutEvent());
      return;
    }
    add(AccountSyncLoggedEvent(user: user));
  }

  void _logout() {
    userRepository.logout();
  }
}
