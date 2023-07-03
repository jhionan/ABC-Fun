import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';

abstract interface class SettingsRepository {
  Future<SettingsEntity?> getSettings();
  Future<void> insertSettings(SettingsEntity settingsEntity);
  Future<void> deleteSettings(SettingsEntity settingsEntity);
}
