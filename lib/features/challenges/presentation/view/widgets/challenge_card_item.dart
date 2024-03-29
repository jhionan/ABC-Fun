import 'package:abc_fun/core/db/schemas/action_item_dto.dart';
import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_button.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChallengeCardItem extends StatelessWidget {
  const ChallengeCardItem({
    super.key,
    required this.items,
    required this.onValueChanged,
    this.activeItems = const {},
  });

  final List<ActionItemEntity> items;
  final Set<String> activeItems;
  final void Function(bool value) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: AbcCard(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  children: items.map((e) => _imageFromEntityType(e)).toList()),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    items.first.actionName(context),
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AbcColors.primary,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.intl.challengeItemCardImagesQuantity(items.length),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Switch(
                  value: items.first.isActive,
                  onChanged: onValueChanged,
                ),
                const SizedBox(
                  height: 16,
                ),
                if (items.first.group == ActionGroup.custom)
                  AbcButton.secondary(
                    text: context.intl.buttonEdit,
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageFromEntityType(ActionItemEntity e) {
    if (e.group == ActionGroup.custom) {
      ActionItemDto item = e as ActionItemDto;
      return Image.memory(
        Uint8List.fromList(item.imageBytes!),
        key: UniqueKey(),
      );
    }
    return Image.asset(
      e.imagePath,
      key: UniqueKey(),
    );
  }
}
