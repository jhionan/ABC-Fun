//generate dao methods
import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:isar/isar.dart';

class ActionCustomItemDao {
  ActionCustomItemDao(this.fIsar) {
    _ensureOpennedDb();
  }

  final Future<Isar> fIsar;
  Isar? _isar;

  Isar get isar => _isar!;
  Future<void> _ensureOpennedDb() async {
    _isar ??= await fIsar;
  }

  Future<List<ActionCustomItemEntity>> getAllItems() async {
    await _ensureOpennedDb();
    return await isar.actionCustomItemEntitys.where().findAll();
  }

  Future<void> insert(ActionCustomItemEntity item) async {
    await _ensureOpennedDb();
    await isar.writeTxn(() async {
      await isar.actionCustomItemEntitys.put(item);
    });
  }

  Future<void> insertMany(List<ActionCustomItemEntity> items) async {
    await _ensureOpennedDb();
    await isar.writeTxn(() async {
      await isar.actionCustomItemEntitys.putAll(items);
    });
  }

  Future<void> delete(ActionCustomItemEntity item) async {
    await _ensureOpennedDb();
    await isar.writeTxn(() async {
      isar.actionCustomItemEntitys.delete(item.id!);
    });
  }

  Future<void> deleteMany(List<ActionCustomItemEntity> items) async {
    await _ensureOpennedDb();
    await isar.writeTxn(() async {
      await isar.actionCustomItemEntitys.deleteAll(items.map((e) => e.id!).toList());
    });
  }
}
