import 'package:aba/core/images.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/report_result_widget_title.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/result_card.dart';
import 'package:aba/features/game/domain/models/action_statistics.dart';
import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    TotalActionResults totalActionResults = TotalActionResults(
    averangeCorrect: 50,
    totalShown: 15,
    completedRounds: 10
  );
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.dimensions.maxHorizontalWidth,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dimensions.hMargin, vertical: context.dimensions.vMargin),
        child: Column(
          children: [
           ReportResultWidgetTitle(
            imageUrl: Images.supportIcon,
            title: context.intl.resultWidget,
           ),
           Padding(
             padding: EdgeInsets.only(top: context.dimensions.vMargin),
             child: ResultCard(
              imageUrl: Images.averageResultsIcon,
              text: context.intl.resultCardAverange,
              result: totalActionResults.averangeCorrect,
              type: ResultCardType.large,
             ),
           ),
           Padding(
             padding: EdgeInsets.only(top: context.dimensions.vMargin),
             child: ResultCard(
              imageUrl: Images.totalChallengesResults,
              text: context.intl.resultCardDoneChallanges,
              result: totalActionResults.totalShown,
             ),
           ),
           Padding(
             padding: EdgeInsets.only(top: context.dimensions.vMargin),
             child: ResultCard(
              imageUrl: Images.totalAverangeSuccessResults,
              text: context.intl.resultCardSucessChanllanges,
              result: totalActionResults.completedRounds,
             ),
           ),
          ],
        ),
      ),
    );
  }
}
