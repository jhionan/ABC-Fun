//generate dao methods
import 'package:abc_fun/core/db/db.dart';
import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';

class ActionCustomItemDao {
  ActionCustomItemDao(this.db);

  Db<ActionCustomItemEntity> db;

  Future<List<ActionCustomItemEntity>> getAllItems() async {
    return await db.getAll();
  }

  Future<void> insert(ActionCustomItemEntity item) async {
    await db.insert(item);
  }

  Future<void> insertMany(List<ActionCustomItemEntity> items) async {
    await db.insertAll(items);
  }

  Future<void> delete(ActionCustomItemEntity item) async {
    await db.delete(item);
  }

  Future<void> deleteMany(List<ActionCustomItemEntity> items) async {
    await db.deleteAll(items);
  }
}
