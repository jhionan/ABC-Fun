//generate dao methods
import 'package:abc_fun/core/db/db.dart';
import 'package:abc_fun/core/db/schemas/game_session_dto.dart';

class GameSessionDao {
  GameSessionDao(this.db);

  Db<GameSessionDto> db;

  Future<List<GameSessionDto>> getAllItems() async {
    return await db.getAll();
  }

  Future<void> insert(GameSessionDto item) async {
    await db.insert(item);
  }

  Future<void> insertMany(List<GameSessionDto> items) async {
    throw Exception('not implemented');
    // await db.insertAll(items);
  }

  Future<void> delete(GameSessionDto item) async {
    await db.delete(item);
  }

  Future<void> deleteMany(List<GameSessionDto> items) async {
    await db.deleteAll(items);
  }
}
