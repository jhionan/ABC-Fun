import 'dart:async';

import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/features/game/domain/models/action_item_entity.dart';
import 'package:aba/features/widgets/abc_button.dart';
import 'package:aba/features/widgets/abc_card.dart';
import 'package:flutter/material.dart';

class ChallengeCardItem extends StatelessWidget {
  const ChallengeCardItem({
    super.key,
    required this.items,
    required this.isActivated,
    required this.onValueChanged,
  });

  final List<ActionItemEntity> items;
  final Stream<bool> isActivated;
  final StreamSink<(ActionGroup, bool)> onValueChanged;

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
                  children: items.map((e) => Image.asset(e.imagePath)).toList()),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items.first.actionName(context),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AbcColors.primary,
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
                StreamBuilder<bool>(
                    stream: isActivated,
                    builder: (context, snapshot) {
                      return Switch(
                        value: snapshot.data ?? false,
                        onChanged: (value) {
                          onValueChanged.add((items.first.group, value));
                        },
                      );
                    }),
                const SizedBox(
                  height: 16,
                ),
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
}
