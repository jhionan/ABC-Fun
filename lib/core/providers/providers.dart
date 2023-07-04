import 'package:abc_fun/core/actions_audio.dart';
import 'package:abc_fun/core/data/appwrite_client.dart';
import 'package:abc_fun/core/data/repositories/user_repository.dart';
import 'package:abc_fun/core/db/daos/action_custom_item_dao.dart';
import 'package:abc_fun/core/db/daos/game_session_dao.dart';
import 'package:abc_fun/core/db/daos/settings_dao.dart';
import 'package:abc_fun/core/db/db_imp/isar_db_action_custom_item_imp.dart';
import 'package:abc_fun/core/db/db_imp/isar_db_game_session_imp.dart';
import 'package:abc_fun/core/db/db_imp/isar_db_settings_imp.dart';
import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:abc_fun/core/db/schemas/game_session_dto.dart';
import 'package:abc_fun/core/db/schemas/settings_dto.dart';
import 'package:abc_fun/core/domain/action_items_repository.dart';
import 'package:abc_fun/core/domain/repositories/user_repository.dart';
import 'package:abc_fun/core/navigation/abc_router.dart';
import 'package:abc_fun/core/utils/helpers/path_provider_helper/path_provider_helper.dart';
import 'package:abc_fun/features/game/data/action_items_default_data_source.dart';
import 'package:abc_fun/features/game/data/action_items_local_data_source.dart';
import 'package:abc_fun/features/game/data/action_items_repository.dart';
import 'package:abc_fun/features/game/data/game_session_local_data_source.dart';
import 'package:abc_fun/features/game/data/game_session_repository.dart';
import 'package:abc_fun/features/game/domain/game_session_repository.dart';
import 'package:abc_fun/features/settings/data/settings_default_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_local_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_remote_data_source.dart';
import 'package:abc_fun/features/settings/data/settings_repository_imp.dart';
import 'package:abc_fun/features/settings/domain/settings_repository.dart';
import 'package:isar/isar.dart';
import 'package:riverpod/riverpod.dart';

late ProviderContainer provider;

final class Providers {
  static final appRouter = Provider<AbcRouter>((ref) {
    return AbcRouter();
  });

  static final actionAudio = Provider<ActionAudio>((ref) {
    return ActionAudio();
  });

  static final _appwriteClient = Provider<AppwriteClient>((ref) {
    return AppwriteClient();
  });

  static final userRepository = Provider<UserRepository>((ref) {
    return UserRepositoryImp(appwriteClient: ref.read<AppwriteClient>(_appwriteClient));
  });

  static final pathProviderHelper = Provider<PathProviderHelper>((ref) {
    return PathProviderHelper();
  });

  static final isarDb = Provider<Future<Isar>>((ref) async {
    final path = await ref.read<PathProviderHelper>(pathProviderHelper).getApplicationDocumentsDirectoryPath();
    final isar = await Isar.open(
      [
        ActionCustomItemEntitySchema,
        SettingsDtoSchema,
        GameSessionDtoSchema,
      ],
      directory: path,
    );
    return isar;
  });

  static final _actionItemDao = Provider<ActionCustomItemDao>((ref) {
    return ActionCustomItemDao(IsarDbActionCustomItemImp(ref.read<Future<Isar>>(isarDb)));
  });

  static final _actionItemDefaultDataSource = Provider<ActionItemsDefaultDataSource>((ref) {
    return ActionItemsDefaultDataSource();
  });

  static final _actionItemsLocalDataSource = Provider<ActionItemsLocalDataSource>((ref) {
    return ActionItemsLocalDataSource(ref.read<ActionCustomItemDao>(_actionItemDao));
  });

  static final actionItemsRepository = Provider<ActionItemsRepository>((ref) {
    return ActionItemsRepositoryImp(
      defaultDataSource: ref.read<ActionItemsDefaultDataSource>(_actionItemDefaultDataSource),
      localDataSource: ref.read<ActionItemsLocalDataSource>(_actionItemsLocalDataSource),
    );
  });

  static final _gameSessionDao = Provider<GameSessionDao>((ref) {
    return GameSessionDao(IsarDbGameSessionImp(ref.read<Future<Isar>>(isarDb)));
  });

  static final _gameSessionLocalDataSource = Provider<GameSessionRepository>((ref) {
    return GameSessionLocalDataSouce(ref.read<GameSessionDao>(_gameSessionDao));
  });

  static final gameSessionRepository = Provider<GameSessionRepository>((ref) {
    return GameSessionRepositoryImp(localDataSource: ref.read<GameSessionRepository>(_gameSessionLocalDataSource));
  });

  static final _settingsDao = Provider<SettingsDao>((ref) {
    return SettingsDao(IsarDbSettingsImp(ref.read<Future<Isar>>(isarDb)));
  });

  static final _settingsLocalDataSource = Provider<SettingsLocalDataSource>((ref) {
    return SettingsLocalDataSource(
      settingsDao: ref.read<SettingsDao>(_settingsDao),
    );
  });

  static final _settingsRemoteDataSource = Provider<SettingsRemoteDataSource>((ref) {
    return SettingsRemoteDataSource(
      appwriteClient: ref.read<AppwriteClient>(_appwriteClient),
    );
  });

  static final settingsRepository = Provider<SettingsRepository>((ref) {
    return SettingsRepositoryImp(
      settingsDefaultDataSource: SettingsDefaultDataSource(),
      settingsLocalDataSource: ref.read<SettingsLocalDataSource>(_settingsLocalDataSource),
      settingsRemoteDataSource: ref.read<SettingsRemoteDataSource>(_settingsRemoteDataSource),
    );
  });
}
