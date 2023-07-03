import 'package:abc_fun/core/domain/view/widgets/abc_drop_down.dart';
class SettingsSelectEntity implements AbcDropDownObject<int> {
  SettingsSelectEntity({required this.name, required this.quantity});

  @override
  final String name;
  final int quantity;

  @override
  int get value => quantity;
}
