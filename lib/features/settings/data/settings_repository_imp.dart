import 'package:abc_fun/core/db/schemas/settings_dto.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:abc_fun/features/settings/data/settings_default_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_local_data_source.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';

class SettingsRepositoryImp implements SettingsRepository {
  SettingsRepositoryImp({
    required this.settingsDefaultDataSource,
    required this.settingsLocalDataSource,
  }) {
    _seedDb();
  }

  final SettingsDefaultDataSource settingsDefaultDataSource;
  final SettingsLocalDataSource settingsLocalDataSource;

  Future<void> _seedDb() async {
    if (await settingsLocalDataSource.getSettings() != null) {
      return;
    }
    SettingsEntity settingsEntity = await settingsDefaultDataSource.getSettings();
    SettingsDto settingsDto = SettingsDto(
      selectedActionsPerStage: settingsEntity.selectedActionsPerStage,
      selectedStageQuantity: settingsEntity.selectedStageQuantity,
    );
    await settingsLocalDataSource.insertSettings(settingsDto);
  }

  @override
  Future<void> deleteSettings(SettingsEntity settingsEntity) async {
    await settingsLocalDataSource.deleteSettings(settingsEntity);
  }

  @override
  Future<SettingsEntity?> getSettings() async {
    await _seedDb();
    return await settingsLocalDataSource.getSettings();
  }

  @override
  Future<void> insertSettings(SettingsEntity settingsEntity) {
    return settingsLocalDataSource.insertSettings(settingsEntity);
  }
}
