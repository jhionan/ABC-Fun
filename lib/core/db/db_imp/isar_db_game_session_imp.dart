import 'dart:async';

import 'package:abc_fun/core/db/db.dart';
import 'package:abc_fun/core/db/schemas/game_session_dto.dart';
import 'package:isar/isar.dart';

class IsarDbGameSessionImp implements Db<GameSessionDto> {
  IsarDbGameSessionImp(this._isar) {
    _ensureOpennedDb();
  }
  final Future<Isar> _isar;
  Isar? _opennedIsar;

  @override
  Future<void> delete(GameSessionDto item) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      _opennedIsar!.gameSessionDtos.delete(item.id!);
    });
  }

  @override
  Future<void> deleteAll(List<GameSessionDto> items) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.gameSessionDtos.deleteAll(items.map((e) => e.id!).toList());
    });
  }

  @override
  Future<GameSessionDto?> get(Object id) async {
    await _ensureOpennedDb();
    if (id is int) {
      return await _opennedIsar!.gameSessionDtos.get(id);
    }
    throw Exception('id must be int');
  }

  @override
  Future<List<GameSessionDto>> getAll() async {
    await _ensureOpennedDb();
    return await _opennedIsar!.gameSessionDtos.where().findAll();
  }

  @override
  Future<void> insert(GameSessionDto item) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.gameSessionDtos.put(item);
    });
  }

  @override
  Future<void> insertAll(List<GameSessionDto> items) async {
    await _ensureOpennedDb();
    await _opennedIsar!.writeTxn(() async {
      await _opennedIsar!.gameSessionDtos.putAll(items);
    });
  }

  @override
  Future<void> update(GameSessionDto item) async {
    await _ensureOpennedDb();
    await insert(item);
  }

  @override
  Future<void> updateAll(List<GameSessionDto> items) async {
    await _ensureOpennedDb();
    await insertAll(items);
  }

  Future<void> _ensureOpennedDb() async {
    _opennedIsar ??= await _isar;
  }

  @override
  Stream<void> onDbchanged() async* {
    await _ensureOpennedDb();
    yield* _opennedIsar!.gameSessionDtos.watchLazy();
  }
}
