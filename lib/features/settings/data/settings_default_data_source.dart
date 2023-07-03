import 'dart:typed_data';

import 'package:abc_fun/features/settings/domain/settings_constants.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';

class SettingsDefaultDataSource implements SettingsRepository {
  @override
  Uint8List? get rewardImageBytes => null;

  @override
  int get selectedActionsPerStage => kMaxActionsPerStage;

  @override
  int get selectedStageQuantity => kMaxStageQuantity;

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
}
