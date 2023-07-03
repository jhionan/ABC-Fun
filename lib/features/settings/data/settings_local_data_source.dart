import 'dart:typed_data';

import 'package:abc_fun/features/settings/domain/settings_repository.dart';

class SettingsLocalDataSource implements SettingsRepository {
  @override
  Uint8List? get rewardImageBytes => throw UnimplementedError();

  @override
  Future<void> saveActionsPerStage(int actionsPerStage) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveRewardImageBytes(Uint8List rewardImageBytes) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveStageQuantity(int stageQuantity) {
    throw UnimplementedError();
  }

  @override
  int get selectedActionsPerStage => throw UnimplementedError();

  @override
  int get selectedStageQuantity => throw UnimplementedError();
  
}