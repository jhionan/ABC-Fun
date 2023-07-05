import 'package:abc_fun/core/data/appwrite_client.dart';
import 'package:abc_fun/core/db/schemas/game_session_dto.dart';
import 'package:abc_fun/features/game/domain/game_session_repository.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class GameSessionRemoteDataSource implements GameSessionRepository {
  AppwriteClient appwriteClient;
  GameSessionRemoteDataSource({
    required this.appwriteClient,
  });

  @override
  Future<List<GameSessionDto>?> getAll() async {
    String? userId = await appwriteClient.userId;
    if (userId == null) {
      return null;
    }
    try {
      DocumentList sessionDocument = await appwriteClient.databases.listDocuments(
        databaseId: appwriteClient.dataBaseId,
        collectionId: Collection.gameSessions.toString(),
      );
      List<GameSessionDto> gameSessions =
          sessionDocument.documents.map((e) => GameSessionDto.fromJson(e.data)).toList();
      return gameSessions;
    } catch (_) {}
    return null;
  }

  @override
  Future<void> insert(GameSessionDto item) async {
    String? userId = await appwriteClient.userId;
    if (userId == null) {
      return;
    }
    await appwriteClient.databases.createDocument(
      databaseId: appwriteClient.dataBaseId,
      collectionId: Collection.gameSessions.toString(),
      permissions: appwriteClient.defaultPermissions(userId),
      documentId: ID.unique(),
      data: item.toJson(),
    );
  }

  @override
  Stream<void> onDbChanged() {
    // TODO: implement onDbChanged
    throw UnimplementedError();
  }
  
  @override
  Future<void> insertAll(List<GameSessionDto> items) {
    // TODO: implement insertAll
    throw UnimplementedError();
  }
}
