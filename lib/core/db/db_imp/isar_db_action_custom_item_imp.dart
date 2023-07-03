import 'dart:async';

import 'package:abc_fun/core/db/db.dart';
import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:isar/isar.dart';

class IsarDbActionCustomItemImp implements Db<ActionCustomItemEntity> {
  IsarDbActionCustomItemImp(this._isar) {
    _ensureOpennedDb();
  }
  final Future<Isar> _isar;
  Isar? _opennedIsar;

  @override
  Future<void> delete(ActionCustomItemEntity item) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      _opennedIsar!.actionCustomItemEntitys.delete(item.id!);
    });
  }

  @override
  Future<void> deleteAll(List<ActionCustomItemEntity> items) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.actionCustomItemEntitys.deleteAll(items.map((e) => e.id!).toList());
    });
  }

  @override
  Future<ActionCustomItemEntity?> get(Object id) async {
    await _ensureOpennedDb();
    if (id is int) {
      return await _opennedIsar!.actionCustomItemEntitys.get(id);
    }
    throw Exception('id must be int');
  }

  @override
  Future<List<ActionCustomItemEntity>> getAll() async {
    await _ensureOpennedDb();
    return await _opennedIsar!.actionCustomItemEntitys.where().findAll();
  }

  @override
  Future<void> insert(ActionCustomItemEntity item) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.actionCustomItemEntitys.put(item);
    });
  }

  @override
  Future<void> insertAll(List<ActionCustomItemEntity> items) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.actionCustomItemEntitys.putAll(items);
    });
  }

  @override
  Future<void> update(ActionCustomItemEntity item) async {
    await _ensureOpennedDb();
    await insert(item);
  }

  @override
  Future<void> updateAll(List<ActionCustomItemEntity> items) async {
    await _ensureOpennedDb();
    await insertAll(items);
  }

  Future<void> _ensureOpennedDb() async {
    _opennedIsar ??= await _isar;
  }
  
  @override
  Stream<void> onDbchanged() async* {
    await _ensureOpennedDb();
    yield* _opennedIsar!.actionCustomItemEntitys.watchLazy();
  }
}
