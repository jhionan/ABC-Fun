//generate dao methods
import 'package:abc_fun/core/db/db.dart';
import 'package:abc_fun/core/db/schemas/action_item_dto.dart';

class ActionCustomItemDao {
  ActionCustomItemDao(this.db);

  Db<ActionItemDto> db;

  Future<List<ActionItemDto>> getAllItems() async {
    return await db.getAll();
  }

  Future<void> insert(ActionItemDto item) async {
    await db.insert(item);
  }

  Future<void> insertMany(List<ActionItemDto> items) async {
    await db.insertAll(items);
  }

  Future<void> delete(ActionItemDto item) async {
    await db.delete(item);
  }

  Future<void> deleteAll() async {
    await db.deleteAll();
  }
}
