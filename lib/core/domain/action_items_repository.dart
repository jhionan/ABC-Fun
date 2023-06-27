import 'package:aba/core/domain/models/action_item_entity.dart';

abstract class ActionItemsRepository {
  Future<List<ActionItemEntity>> getAllItems();
  Future<void> addItem(ActionItemEntity item);
  Future<void> addAllItems(List<ActionItemEntity> items);
  Future<void> deleteItem(ActionItemEntity item);
  Future<void> deleteManyItems(List<ActionItemEntity> items);
}
