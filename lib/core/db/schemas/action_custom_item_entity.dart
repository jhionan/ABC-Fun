import 'package:aba/core/domain/models/action_item_entity.dart';
import 'package:realm/realm.dart';
part 'action_custom_item_entity.g.dart';

@RealmModel()
class _ActionCustomItemEntity implements ActionItemEntity {
  @override
  late String name;
  @override
  @Ignored()
  int get dificulty => 2;
  @override
  late String imagePath;

  String? audioPath;

  @override
  @Ignored()
  ActionGroup get group => ActionGroup.custom;

  @override
  List<ActionGroup> notAllowedWith = [];
}
