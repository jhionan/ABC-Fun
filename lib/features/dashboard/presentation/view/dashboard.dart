import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/play_card.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/report_widget.dart';
import 'package:aba/features/dashboard/presentation/view/widgets/results_widget.dart';
import 'package:aba/features/widgets/abc_divider.dart';
import 'package:aba/features/widgets/background_widget.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: AdaptativeScreenBuilder(
      builder: (context, type) {
        bool isHandset = type == AdaptativeScreenType.handset;
        return BackgroundWidget(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: context.dimensions.vMargin),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isHandset ? context.dimensions.max2ColumnsWidth/2: context.dimensions.max2ColumnsWidth,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: context.dimensions.hMargin*2),
                      child: Center(child: const PlayCard()),
                    ),
                    const AbcMobileDivider(),
                    Center(
                      child: Wrap(
                        direction: isHandset ? Axis.vertical : Axis.horizontal,
                        children: [
                          ReportWidget(),
                          const AbcMobileDivider(),
                          const ResultsWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
