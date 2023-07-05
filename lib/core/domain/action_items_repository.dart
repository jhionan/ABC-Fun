import 'package:abc_fun/core/db/schemas/action_item_dto.dart';

abstract interface class ActionItemsRepository {
  Future<List<ActionItemDto>> getAllItems();
  Future<void> addItem(ActionItemDto item);
  Future<void> addAllItems(List<ActionItemDto> items);
  Future<void> deleteItem(ActionItemDto item);
  Future<void> deleteManyItems(List<ActionItemDto> items);
}
