import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_card.dart';

import 'package:abc_fun/core/domain/models/action_statistics_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({super.key, required this.actionStatistics});
  final ActionStatisticsEntity actionStatistics;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: context.dimensions.standartCardHeight,
      ),
      child: AbcCard(
        padding: EdgeInsets.symmetric(horizontal: context.dimensions.hMargin),
        child: Row(
          children: [
            Expanded(
              child: Text(
                actionStatistics.actionGroup.actionName(context: context, defaultName: actionStatistics.actionName),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              '${actionStatistics.errorRatePercentage.toStringAsFixed(0)}%',
              style: const TextStyle(
                color: AbcColors.statisticError,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Text(' ${context.intl.reportWidgetByThemeErrors}')
          ],
        ),
      ),
    );
  }
}
