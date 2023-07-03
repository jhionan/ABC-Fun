import 'package:abc_fun/features/settings/domain/settings_constants.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      if(event is SettingsStageQuantityEvent && state is SettingsLoadedState) {
        var loadedState  = state as SettingsLoadedState;
        emit(SettingsLoadedState(
          selectedStageQuantity: event.stageQuantity,
          selectedActionsPerStage: loadedState.selectedActionsPerStage
        ));
      }
    });
  }
}
