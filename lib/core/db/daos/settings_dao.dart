import 'package:abc_fun/core/db/db.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';

class SettingsDao {
  SettingsDao(this.db);
  final Db<SettingsEntity> db;

  Future<void> insert(SettingsEntity item) async {
    await db.insert(item);
  }

  Future<void> update(SettingsEntity item) async {
    await db.update(item);
  }

  Future<SettingsEntity?> get() async {
    List<SettingsEntity?> list = await db.getAll();
    if (list.isEmpty) {
      return null;
    }
    return list.first;
  }

  Future<void> delete(SettingsEntity item) async {
    await db.delete(item);
  }
}
