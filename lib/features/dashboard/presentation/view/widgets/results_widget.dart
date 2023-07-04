import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_widget.dart';
import 'package:abc_fun/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:abc_fun/features/dashboard/presentation/view/widgets/result_card.dart';
import 'package:abc_fun/core/domain/models/action_statistics_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoadedState) {
          return _buildResults(state, context);
        }
        if(state is DashboardLoadedWithActionErrorsState){
          return _buildResults(state, context);
        }
        if (state is DashboardLoadingState) {
          return Padding(
            padding:  EdgeInsets.all(context.dimensions.hMargin),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Padding _buildResults(DashboardLoadedState state, BuildContext context) {
     TotalActionResults totalActionResults =
        TotalActionResults(averangeCorrect: state.totalCorrect/state.totalMoves, totalShown: state.totalMoves, completedRounds: state.totalSessions);
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
              result: '${(totalActionResults.averangeCorrect * 100).toStringAsFixed(2)}%',
              type: ResultCardType.large,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: context.dimensions.vMargin),
            child: ResultCard(
              imageUrl: Images.totalChallengesResults,
              text: context.intl.resultCardDoneChallanges,
              result: totalActionResults.totalShown.toString(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: context.dimensions.vMargin),
            child: ResultCard(
              imageUrl: Images.totalAverangeSuccessResults,
              text: context.intl.resultCardSucessChallenges,
              result: totalActionResults.completedRounds.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
