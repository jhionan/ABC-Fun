import 'dart:async';

import 'package:abc_fun/core/db/db.dart';
import 'package:abc_fun/core/db/schemas/settings_dto.dart';
import 'package:isar/isar.dart';

class IsarDbSettingsImp implements Db<SettingsDto> {
  IsarDbSettingsImp(this._isar) {
    _ensureOpennedDb();
  }
  final Future<Isar> _isar;
  Isar? _opennedIsar;

  @override
  Future<void> delete(SettingsDto item) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      _opennedIsar!.settingsDtos.delete(item.id!);
    });
  }

  @override
  Future<void> deleteAll(List<SettingsDto> items) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.settingsDtos.deleteAll(items.map((e) => e.id!).toList());
    });
  }

  @override
  Future<SettingsDto?> get(Object id) async {
    await _ensureOpennedDb();
    if (id is int) {
      return await _opennedIsar!.settingsDtos.get(id);
    }
    throw Exception('id must be int');
  }

  @override
  Future<List<SettingsDto>> getAll() async {
    await _ensureOpennedDb();
    return await _opennedIsar!.settingsDtos.where().findAll();
  }

  //Force insert just 1 item
  @override
  Future<void> insert(SettingsDto item) async {
    await _ensureOpennedDb();
    SettingsDto itemToInsert = item;
    List<SettingsDto?> items = await getAll();
    if (items.isNotEmpty) {
      itemToInsert.id = items.first!.id;
    }

    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.settingsDtos.put(itemToInsert);
    });
  }

  @override
  Future<void> insertAll(List<SettingsDto> items) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.settingsDtos.putAll(items);
    });
  }

  @override
  Future<void> update(SettingsDto item) async {
    await _ensureOpennedDb();
    await insert(item);
  }

  @override
  Future<void> updateAll(List<SettingsDto> items) async {
    await _ensureOpennedDb();
    await insertAll(items);
  }

  Future<void> _ensureOpennedDb() async {
    _opennedIsar ??= await _isar;
  }
}
