import 'dart:async';

import 'package:abc_fun/core/db/db.dart';
import 'package:abc_fun/core/db/schemas/action_item_dto.dart';
import 'package:isar/isar.dart';

class IsarDbActionCustomItemImp implements Db<ActionItemDto> {
  IsarDbActionCustomItemImp(this._isar) {
    _ensureOpennedDb();
  }
  final Future<Isar> _isar;
  Isar? _opennedIsar;

  @override
  Future<void> delete(ActionItemDto item) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      _opennedIsar!.actionItemDtos.delete(item.id!);
    });
  }

  @override
  Future<void> deleteAll() async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.actionItemDtos.clear();
    });
  }

  @override
  Future<ActionItemDto?> get(Object id) async {
    await _ensureOpennedDb();
    if (id is int) {
      return await _opennedIsar!.actionItemDtos.get(id);
    }
    throw Exception('id must be int');
  }

  @override
  Future<List<ActionItemDto>> getAll() async {
    await _ensureOpennedDb();
    return await _opennedIsar!.actionItemDtos.where().findAll();
  }

  @override
  Future<void> insert(ActionItemDto item) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.actionItemDtos.put(item);
    });
  }

  @override
  Future<void> insertAll(List<ActionItemDto> items) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.actionItemDtos.putAll(items);
    });
  }

  @override
  Future<void> update(ActionItemDto item) async {
    await _ensureOpennedDb();
    await insert(item);
  }

  @override
  Future<void> updateAll(List<ActionItemDto> items) async {
    await _ensureOpennedDb();
    await insertAll(items);
  }

  Future<void> _ensureOpennedDb() async {
    _opennedIsar ??= await _isar;
  }

  @override
  Stream<void> onDbchanged() async* {
    await _ensureOpennedDb();
    yield* _opennedIsar!.actionItemDtos.watchLazy();
  }
}
