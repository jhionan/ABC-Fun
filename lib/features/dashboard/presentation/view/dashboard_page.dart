import 'dart:math';

import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/widgets/abc_scaffold.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/play_card.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/results_widget.dart';
import 'package:aba/features/widgets/abc_divider.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbcScaffold(
      adaptativeBuilder: (context, type, constraints) {
        bool isHandset = type == AdaptativeScreenType.handset;
        double maxElementWidth = min(constraints.maxWidth / 2, context.dimensions.max2ColumnsWidth / 2);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: PlayCard()),
            const AbcMobileDivider(),
            Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                alignment: WrapAlignment.spaceEvenly,
                runAlignment: WrapAlignment.end,
                children: [
                  SizedBox(width: !isHandset ? maxElementWidth : null, child: const ResultsWidget()),
                  // SizedBox(
                  //   width: !isHandset ? maxElementWidth : null,
                  //   child: ReportWidget()),
                  const AbcMobileDivider(),
                  SizedBox(width: !isHandset ? maxElementWidth : null, child: const ResultsWidget()),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
