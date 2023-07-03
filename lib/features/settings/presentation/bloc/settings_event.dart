part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class SettingsStageQuantityEvent extends SettingsEvent {
  SettingsStageQuantityEvent(this.stageQuantity);
  final int stageQuantity;
}