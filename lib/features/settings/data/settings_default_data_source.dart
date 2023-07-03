import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:abc_fun/features/settings/domain/settings_constants.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';

class SettingsDefaultDataSource implements SettingsRepository {
  @override
  Future<void> deleteSettings(SettingsEntity settingsEntity) {
    throw UnimplementedError();
  }

  @override
  Future<SettingsEntity> getSettings() async {
    return SettingsEntity(
      selectedActionsPerStage: kMaxActionsPerStage,
      selectedStageQuantity: kMaxStageQuantity,
    );
  }

  @override
  Future<void> insertSettings(SettingsEntity settingsEntity) {
    throw UnimplementedError();
  }
}
