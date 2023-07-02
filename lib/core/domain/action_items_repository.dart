import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';

abstract interface class ActionItemsRepository {
  Future<List<ActionCustomItemEntity>> getAllItems();
  Future<void> addItem(ActionCustomItemEntity item);
  Future<void> addAllItems(List<ActionCustomItemEntity> items);
  Future<void> deleteItem(ActionCustomItemEntity item);
  Future<void> deleteManyItems(List<ActionCustomItemEntity> items);
}
