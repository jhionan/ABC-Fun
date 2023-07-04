import 'package:abc_fun/core/data/appwrite_client.dart';
import 'package:abc_fun/core/db/schemas/settings_dto.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_entity.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';

class SettingsRemoteDataSource implements SettingsRepository {
  SettingsRemoteDataSource({
    required this.appwriteClient,
  });
  final AppwriteClient appwriteClient;

  Future<bool> isLogged() async {
    return (await appwriteClient.getUser()).isLogged;
  }

  @override
  Future<void> deleteSettings(SettingsEntity settingsEntity) async {
    try {
      String userID = await appwriteClient.userId;
      appwriteClient.databases.deleteDocument(
        databaseId: appwriteClient.dataBaseId,
        collectionId: Collection.settings.toString(),
        documentId: userID,
      );
    } catch (_) {}
  }

  @override
  Stream<SettingsEntity?> getSettings() async* {
    String userID = await appwriteClient.userId;
    Document? document;
    SettingsDto? settingsDto;
    SettingsEntity? entity;
    try {
      document = await appwriteClient.databases.getDocument(
        databaseId: appwriteClient.dataBaseId,
        collectionId: Collection.settings.toString(),
        documentId: userID,
      );
      settingsDto = SettingsDto.fromJson(document.data);
      entity = SettingsEntity.fromDto(settingsDto);
    } catch (_) {
      yield null;
      return;
    }
    try {
      Uint8List imageFromBucket =
          await appwriteClient.storage.getFileView(bucketId: appwriteClient.settingsBucketId, fileId: userID);
      entity.rewardImageBytes = imageFromBucket.toList();
    } catch (_) {}

    yield entity;
  }

  @override
  Future<void> insertSettings(SettingsEntity settingsEntity) async {
    String userID = await appwriteClient.userId;
    try {
      appwriteClient.databases.updateDocument(
        databaseId: appwriteClient.dataBaseId,
        collectionId: Collection.settings.toString(),
        documentId: userID,
        data: SettingsDto(
          selectedActionsPerStage: settingsEntity.selectedActionsPerStage,
          selectedStageQuantity: settingsEntity.selectedStageQuantity,
        ).toJson(),
      );
      if (settingsEntity.rewardImageBytes != null) {
        await appwriteClient.storage.deleteFile(bucketId: appwriteClient.settingsBucketId, fileId: userID);
        appwriteClient.storage.createFile(
            file: InputFile.fromBytes(
                bytes: settingsEntity.rewardImageBytes!, filename: 'settings$userID', contentType: 'image/png/webp'),
            bucketId: appwriteClient.settingsBucketId,
            fileId: userID,
            permissions: appwriteClient.defaultPermissions(userID));
      }
    } on AppwriteException {
      appwriteClient.databases.createDocument(
        databaseId: appwriteClient.dataBaseId,
        collectionId: Collection.settings.toString(),
        documentId: userID,
        data: SettingsDto(
          selectedActionsPerStage: settingsEntity.selectedActionsPerStage,
          selectedStageQuantity: settingsEntity.selectedStageQuantity,
        ).toJson(),
      );
      if (settingsEntity.rewardImageBytes != null) {
        appwriteClient.storage.createFile(
            file: InputFile.fromBytes(
                bytes: settingsEntity.rewardImageBytes!, filename: 'settings$userID', contentType: 'image/png/webp'),
            bucketId: appwriteClient.settingsBucketId,
            fileId: userID,
            permissions: appwriteClient.defaultPermissions(userID));
      }
    } catch (_) {}
  }
}
