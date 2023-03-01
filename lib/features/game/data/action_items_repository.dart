import 'package:aba/features/game/data/action_items_local_data_source_imp.dart';
import 'package:aba/features/game/domain/action_items_repository.dart';
import 'package:aba/features/game/domain/models/action_item_entity.dart';

class ActionItemsRepositoryImp implements ActionItemsRepository {
  final ActionItemsLocalDataSourceImp localDataSource;

  ActionItemsRepositoryImp({
    required this.localDataSource,
  });

  @override
  Future<List<ActionItemEntity>> getAllItems() async {
    return localDataSource.getAllItems();
  }

  @override
  Future<List<ActionItemEntity>> getItemsByDificulty(int dificulty) {
    // TODO: implement getItemsByDificulty
    throw UnimplementedError();
  }
}
