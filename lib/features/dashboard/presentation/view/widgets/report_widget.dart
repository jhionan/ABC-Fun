import 'package:abc_fun/core/domain/models/action_statistics_entity.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_widget.dart';
import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:abc_fun/features/dashboard/presentation/view/widgets/report_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final List<ActionStatisticsEntity> actionStatistics = [];

        if (state is DashboardLoadedWithActionErrorsState) {
          actionStatistics.addAll(state.actionErrors.map((e) => ActionStatisticsEntity(
              actionName: e.actionName, totalIncorrect: e.totalWrong, totalShown: e.totalPlayed, actionGroup: e.group)));
          
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.dimensions.maxHorizontalWidth,
            ),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.dimensions.hMargin, vertical: context.dimensions.vMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AbcTitleWidget.small(imageUrl: Images.performanceIcon, title: context.intl.reportWidgetByTheme),
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
        if (state is DashboardLoadingState) {
          return Padding(
            padding: EdgeInsets.all(context.dimensions.hMargin),
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
