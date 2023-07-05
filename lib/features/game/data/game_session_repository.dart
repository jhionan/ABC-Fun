import 'package:abc_fun/core/data/appwrite_client.dart';
import 'package:abc_fun/core/db/schemas/game_session_dto.dart';
import 'package:abc_fun/core/domain/repositories/user_repository.dart';
import 'package:abc_fun/features/game/domain/game_session_repository.dart';

class GameSessionRepositoryImp implements GameSessionRepository {
  GameSessionRepository localDataSource;
  GameSessionRepository remoteDataSource;
  UserRepository userRepository;
  GameSessionRepositoryImp(
      {required this.localDataSource, required this.remoteDataSource, required this.userRepository});
  @override
  Future<List<GameSessionDto>?> getAll() async {
    List<GameSessionDto>? remoteGameSessions;
    if ((await userRepository.getUser()).isLogged) {
      remoteGameSessions = await remoteDataSource.getAll();
      if (remoteGameSessions != null) {
        await localDataSource.insertAll(remoteGameSessions);
      }
      return remoteGameSessions;
    }
    return (await localDataSource.getAll()) ?? [];
  }

  @override
  Future<void> insert(GameSessionDto item) async {
    await localDataSource.insert(item);
    if ((await userRepository.getUser()).isLogged) {
      await remoteDataSource.insert(item);
    }
  }

  @override
  Stream<void> onDbChanged() {
    return localDataSource.onDbChanged();
  }

  @override
  Future<void> insertAll(List<GameSessionDto> items) {
    throw UnimplementedError();
  }
}
