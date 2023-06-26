import 'package:aba/core/actions_audio.dart';
import 'package:aba/core/db/schemas/action_custom_item_entity.dart';
import 'package:aba/core/navigation/abc_router.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';

late ProviderContainer provider;

final class Providers {
  static final appRouter = Provider<AbcRouter>((ref) {
    return AbcRouter();
  });

  static final actionAudio = Provider<ActionAudio>((ref) {
    return ActionAudio();
  });

  static final audioPlayer = Provider<AudioPlayer>((ref) {
    return AudioPlayer();
  });

  static final db = Provider<Future<Isar>>((ref) async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [ActionCustomItemEntitySchema],
      directory: dir.path,
    );
    return isar;
  });
}
