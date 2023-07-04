import 'package:abc_fun/core/db/daos/action_custom_item_dao.dart';
import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:abc_fun/core/domain/action_items_repository.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';

class ActionItemsLocalDataSource implements ActionItemsRepository {
  final ActionCustomItemDao actionCustomItemDao;

  ActionItemsLocalDataSource(this.actionCustomItemDao);

  @override
  Future<void> addItem(ActionItemEntity item) async {
    if (item is ActionCustomItemEntity) {
      actionCustomItemDao.insert(item);
    }
  }

  @override
  Future<void> addAllItems(List<ActionItemEntity> items) async {
    if (items.every((element) => element is ActionCustomItemEntity)) {
      actionCustomItemDao.insertMany(items as List<ActionCustomItemEntity>);
    }
  }

  @override
  Future<void> deleteItem(ActionItemEntity item) async {
    if (item is ActionCustomItemEntity) {
      actionCustomItemDao.delete(item);
    }
  }

  @override
  Future<void> deleteManyItems(List<ActionItemEntity> items) async {
    if (items.every(
      (element) => element is ActionCustomItemEntity,
    )) {
      actionCustomItemDao.deleteMany(items as List<ActionCustomItemEntity>);
    }
  }

  @override
  Future<List<ActionCustomItemEntity>> getAllItems() {
    return actionCustomItemDao.getAllItems();
  }
}
