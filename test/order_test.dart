import 'package:aba/features/game/domain/models/action_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('order actions', () {
    print(ActionGroup.values.map(
      (e) => e.toString().replaceAll('ActionGroup.', ''),
    ).toList()..sort());
  });
}
