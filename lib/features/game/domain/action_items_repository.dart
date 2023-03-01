import 'package:aba/features/game/domain/models/action_item_entity.dart';

abstract class ActionItemsRepository {
  Future<List<ActionItemEntity>> getAllItems();
  Future<List<ActionItemEntity>> getItemsByDificulty(int dificulty);
}
