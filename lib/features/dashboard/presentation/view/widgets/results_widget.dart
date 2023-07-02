import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_widget.dart';
import 'package:abc_fun/features/dashboard/presentation/view/widgets/result_card.dart';
import 'package:abc_fun/core/domain/models/action_statistics.dart';
import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TotalActionResults totalActionResults =
        TotalActionResults(averangeCorrect: 50, totalShown: 15, completedRounds: 10);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dimensions.hMargin, vertical: context.dimensions.vMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AbcTitleWidget.small(
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
              text: context.intl.resultCardSucessChallenges,
              result: totalActionResults.completedRounds,
            ),
          ),
        ],
      ),
    );
  }
}
