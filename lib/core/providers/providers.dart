import 'package:abc_fun/core/actions_audio.dart';
import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:abc_fun/core/db/schemas/settings_dto.dart';
import 'package:abc_fun/core/navigation/abc_router.dart';
import 'package:abc_fun/core/utils/helpers/path_provider_helper/path_provider_helper.dart';
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

  static final pathProviderHelper = Provider<PathProviderHelper>((ref) {
    return PathProviderHelper();
  });

  static final isarDb = Provider<Future<Isar>>((ref) async {
    final path = await ref.read<PathProviderHelper>(pathProviderHelper).getApplicationDocumentsDirectoryPath();
    final isar = await Isar.open(
      [ActionCustomItemEntitySchema, SettingsDtoSchema],
      directory: path,
    );
    return isar;
  });
}
