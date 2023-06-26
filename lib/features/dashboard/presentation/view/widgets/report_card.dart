import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/features/widgets/abc_card.dart';

import 'package:aba/features/game/domain/models/action_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({super.key, required this.actionStatistics});
  final ActionStatistics actionStatistics;

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
                actionStatistics.action.name,
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
