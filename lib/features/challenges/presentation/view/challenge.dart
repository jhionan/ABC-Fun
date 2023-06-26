import 'dart:async';

import 'package:aba/core/images.dart';
import 'package:aba/core/navigation/abc_router.gr.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/core/utils/widgets/abc_scaffold.dart';
import 'package:aba/core/utils/widgets/abc_title_card.dart';
import 'package:aba/core/utils/widgets/abc_title_widget.dart';
import 'package:aba/features/challenges/presentation/view/widgets/challenge_card_item.dart';
import 'package:aba/features/game/domain/models/action_item_entity.dart';
import 'package:aba/features/widgets/abc_button.dart';
import 'package:aba/features/widgets/abc_divider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class Challenge extends StatelessWidget {
  const Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    final StreamController<bool> test = StreamController<bool>.broadcast();
    final StreamController<(ActionGroup, bool)> test2 = StreamController<(ActionGroup, bool)>()
      ..stream.listen((event) {
        test.add(event.$2);
      });
    return AbcScaffold(
      adaptativeBuilder: (context, type) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AbcButton.backButton(
                context: context,
                onPressed: () => context.router.replace(const Dashboard()),
              ),
            ),
            SizedBox(
              height: context.dimensions.vMargin * 2,
            ),
            AbcTitleCard(
              imageUrl: Images.performanceIcon,
              title: context.intl.challengeTitle,
              description: context.intl.challengeDescription,
              direction: Axis.horizontal,
              child: AbcButton(
                text: context.intl.challengeButtonCreateChallenge,
              ),
            ),
            const AbcMobileDivider(),
            SizedBox(
              height: context.dimensions.vMargin,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.spaceBetween,
              runSpacing: context.dimensions.vMargin/2,
              spacing: context.dimensions.hMargin,
              children: [
                ChallengeCardItem(
              isActivated: test.stream,
              onValueChanged: test2.sink,
              items: [
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth1,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth2,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth2,
                ),
              ],
            ),ChallengeCardItem(
              isActivated: test.stream,
              onValueChanged: test2.sink,
              items: [
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth1,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth2,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth2,
                ),
              ],
            ),ChallengeCardItem(
              isActivated: test.stream,
              onValueChanged: test2.sink,
              items: [
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth1,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth2,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth2,
                ),
              ],
            ),ChallengeCardItem(
              isActivated: test.stream,
              onValueChanged: test2.sink,
              items: [
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth1,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth2,
                ),
                ActionItemEntity(
                  name: ActionGroup.brushingTeeth.name,
                  dificulty: 2,
                  group: ActionGroup.brushingTeeth,
                  imagePath: ActionImages.brushingTeeth2,
                ),
              ],
            ),
              ],
            ),
            
          ],
        );
      },
    );
  }
}
