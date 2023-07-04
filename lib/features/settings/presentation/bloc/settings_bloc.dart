import 'dart:async';

import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:abc_fun/features/settings/domain/settings_constants.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.settingsRepository,
  }) : super(SettingsInitial()) {
    on<SettingsEvent>(_handleEvent);
    _init();
  }
  final SettingsRepository settingsRepository;
  SettingsEntity? _settings;
  StreamSubscription? _settingsSubscription;

  @override
  Future<void> close() async {
    _settingsSubscription?.cancel();
    super.close();
  }

  FutureOr<void> _handleEvent(SettingsEvent event, Emitter<SettingsState> emit) {
    if (event is SettingsLoadedEvent) {
      emit(SettingsLoadedState(
        selectedStageQuantity: event.selectedStageQuantity,
        selectedActionsPerStage: event.selectedActionsPerStage,
        rewardImageBytes: event.rewardImageBytes,
      ));
    }

    if (event is SettingsStageQuantityEvent) {
      _setStageQuantity(event.stageQuantity, emit);
    }

    if (event is SettingsActionsPerStageEvent) {
      _setActionsPerStage(event.actionsPerStage, emit);
    }

    if (event is SettingsRewardImageBytesEvent) {
      _setRewardImageBytes(event.rewardImageBytes, emit);
    }
  }

  Future<void> _init() async {
    _settingsSubscription = settingsRepository.getSettings().listen((event) {
      _settings = event;
      if (_settings == null) {
        addError(Exception('Settings not found'));
        return;
      }
      add(SettingsLoadedEvent(
        selectedStageQuantity: _settings!.selectedStageQuantity,
        selectedActionsPerStage: _settings!.selectedActionsPerStage,
        rewardImageBytes: _settings!.rewardImageBytes,
      ));
    }, onError: (error) {});
  }

  void _setStageQuantity(int stageQuantity, Emitter<SettingsState> emit) {
    _settings!.selectedStageQuantity = stageQuantity;
    settingsRepository.insertSettings(_settings!);
    emit(SettingsLoadedState(
        selectedStageQuantity: _settings!.selectedStageQuantity,
        selectedActionsPerStage: _settings!.selectedActionsPerStage,
        rewardImageBytes: _settings!.rewardImageBytes));
  }

  void _setActionsPerStage(int actionsPerStage, Emitter<SettingsState> emit) {
    _settings!.selectedActionsPerStage = actionsPerStage;
    settingsRepository.insertSettings(_settings!);
    emit(SettingsLoadedState(
        selectedStageQuantity: _settings!.selectedStageQuantity,
        selectedActionsPerStage: _settings!.selectedActionsPerStage,
        rewardImageBytes: _settings!.rewardImageBytes));
  }

  void _setRewardImageBytes(List<int>? rewardImageBytes, Emitter<SettingsState> emit) {
    _settings!.rewardImageBytes = rewardImageBytes;
    settingsRepository.insertSettings(_settings!);
    emit(SettingsLoadedState(
        selectedStageQuantity: _settings!.selectedStageQuantity,
        selectedActionsPerStage: _settings!.selectedActionsPerStage,
        rewardImageBytes: _settings!.rewardImageBytes));
  }
}
