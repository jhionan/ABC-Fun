import 'package:abc_fun/core/db/daos/settings_dao.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';

class SettingsLocalDataSource implements SettingsRepository {
  SettingsDao settingsDao;
  SettingsLocalDataSource({
    required this.settingsDao,
  });

  @override
  Future<void> deleteSettings(SettingsEntity settingsEntity) async {
    return await settingsDao.delete(settingsEntity);
  }

  @override
  Stream<SettingsEntity?> getSettings() async* {
    try {
      yield* settingsDao.get().asStream();
    } catch (_) {}
  }

  @override
  Future<void> insertSettings(SettingsEntity settingsEntity) async {
    try {
      return settingsDao.insert(settingsEntity);
    } catch (_) {}
  }
}
