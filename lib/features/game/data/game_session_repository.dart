import 'package:abc_fun/core/db/schemas/game_session_dto.dart';
import 'package:abc_fun/features/game/domain/game_session_repository.dart';

class GameSessionRepositoryImp implements GameSessionRepository {
  GameSessionRepository localDataSource;
  GameSessionRepositoryImp({
    required this.localDataSource,
  });
  @override
  Future<List<GameSessionDto>>? getAll() async {
    return (await localDataSource.getAll()) ?? [];
  }

  @override
  Future<void> insert(GameSessionDto item) {
    return localDataSource.insert(item);
  }
  
  @override
  Stream<void> onDbChanged() {
   return localDataSource.onDbChanged();
  }

  
}
