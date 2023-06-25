import 'package:aba/core/images.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/report_card.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/report_result_widget_title.dart';
import 'package:aba/features/game/domain/models/action_item_entity.dart';
import 'package:aba/features/game/domain/models/action_statistics.dart';
import 'package:flutter/widgets.dart';

class ReportWidget extends StatelessWidget {
  ReportWidget({super.key});
  final List<ActionStatistics> actionStatistics = [
    // ActionStatistics(
    //   action:
    //       ActionItemEntity(name: 'Correndo', imagePath: 'assets/images/a.png', group: ActionGroup.custom, dificulty: 1),
    //   totalShown: 10,
    //   totalCorrect: 5,
    //   totalIncorrect: 8,
    // ),
    // ActionStatistics(
    //   action:
    //       ActionItemEntity(name: 'Nadando', imagePath: 'assets/images/b.png', group: ActionGroup.custom, dificulty: 1),
    //   totalShown: 10,
    //   totalCorrect: 5,
    //   totalIncorrect: 9,
    // ),
    // ActionStatistics(
    //   action: ActionItemEntity(
    //       name: 'Escalando', imagePath: 'assets/images/c.png', group: ActionGroup.custom, dificulty: 1),
    //   totalShown: 10,
    //   totalCorrect: 5,
    //   totalIncorrect: 1,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.dimensions.maxHorizontalWidth,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dimensions.hMargin, vertical: context.dimensions.vMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReportResultWidgetTitle(imageUrl: Images.performanceIcon, title: context.intl.reportWidgetByTheme),
            ...actionStatistics
                .map((e) => Padding(
                      padding: EdgeInsets.only(top: context.dimensions.vMargin),
                      child: ReportCard(actionStatistics: e),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
