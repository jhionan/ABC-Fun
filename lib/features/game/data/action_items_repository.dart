import 'package:abc_fun/core/db/schemas/action_custom_item_entity.dart';
import 'package:abc_fun/features/game/data/action_items_default_data_source_imp.dart';
import 'package:abc_fun/core/domain/action_items_repository.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:abc_fun/features/game/data/action_items_local_data_source_imp.dart';

class ActionItemsRepositoryImp implements ActionItemsRepository {
  final ActionItemsDefaultDataSourceImp defaultDataSource;
  final ActionItemsLocalDataSourceImp localDataSource;

  ActionItemsRepositoryImp({
    required this.defaultDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<ActionCustomItemEntity>> getAllItems() async {
    List<ActionCustomItemEntity> local = await localDataSource.getAllItems();

    if (local.isEmpty) {
      _seedDb();
      return defaultDataSource.getAllItems();
    }
    return local;
  }

  @override
  Future<void> addItem(ActionItemEntity item) async {
    await localDataSource.addItem(item);
  }

  @override
  Future<void> deleteItem(ActionItemEntity item) async {
    await localDataSource.deleteItem(item);
  }

  @override
  Future<void> deleteManyItems(List<ActionItemEntity> items) async {
    await localDataSource.deleteManyItems(items);
  }

  Future<void> _seedDb() async {
    await localDataSource.addAllItems((await defaultDataSource.getAllItems()));
  }

  @override
  Future<void> addAllItems(List<ActionItemEntity> items) {
    return localDataSource.addAllItems(items);
  }
}
