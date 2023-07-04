import 'package:abc_fun/core/db/schemas/settings_dto.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:abc_fun/features/settings/data/settings_default_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_local_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_remote_data_source.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';

class SettingsRepositoryImp implements SettingsRepository {
  SettingsRepositoryImp({
    required this.settingsDefaultDataSource,
    required this.settingsLocalDataSource,
    required this.settingsRemoteDataSource,
  }) {
    _seedDb();
  }

  final SettingsDefaultDataSource settingsDefaultDataSource;
  final SettingsLocalDataSource settingsLocalDataSource;
  final SettingsRemoteDataSource settingsRemoteDataSource;

  Future<void> _seedDb() async {
    if (await settingsRemoteDataSource.isLogged()) {
      SettingsEntity? remoteSettings = await settingsRemoteDataSource.getSettings().first;
      if (remoteSettings != null) {
        SettingsDto settingsDto = SettingsDto(
          selectedActionsPerStage: remoteSettings.selectedActionsPerStage,
          selectedStageQuantity: remoteSettings.selectedStageQuantity,
          rewardImageBytes: remoteSettings.rewardImageBytes
        );

        await settingsLocalDataSource.insertSettings(settingsDto);
        return;
      }
      SettingsEntity? local = await settingsLocalDataSource.getSettings().first;
      if (local != null) {
        settingsRemoteDataSource.insertSettings(local);
        return;
      }
    }

    SettingsEntity settingsEntity = await settingsDefaultDataSource.getSettings().first;
    SettingsDto settingsDto = SettingsDto(
      selectedActionsPerStage: settingsEntity.selectedActionsPerStage,
      selectedStageQuantity: settingsEntity.selectedStageQuantity,
    );

    await settingsLocalDataSource.insertSettings(settingsDto);
  }

  @override
  Future<void> deleteSettings(SettingsEntity settingsEntity) async {
    await settingsLocalDataSource.deleteSettings(settingsEntity);
    await settingsRemoteDataSource.deleteSettings(settingsEntity);
  }

  @override
  Stream<SettingsEntity?> getSettings() async* {
    yield* settingsLocalDataSource.getSettings();
    await _seedDb();
    yield* settingsLocalDataSource.getSettings();
  }

  @override
  Future<void> insertSettings(SettingsEntity settingsEntity) async {
    await settingsRemoteDataSource.insertSettings(settingsEntity);
    return settingsLocalDataSource.insertSettings(settingsEntity);
  }
}
