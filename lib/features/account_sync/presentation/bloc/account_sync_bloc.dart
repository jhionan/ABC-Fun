import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'account_sync_event.dart';
part 'account_sync_state.dart';

class AccountSyncBloc extends Bloc<AccountSyncEvent, AccountSyncState> {
  AccountSyncBloc() : super(AccountSyncInitial()) {
    on<AccountSyncEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
