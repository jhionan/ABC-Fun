import 'dart:async';

import 'package:aba/core/images.dart';
import 'package:aba/core/navigation/abc_router.gr.dart';
import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/core/utils/widgets/abc_scaffold.dart';
import 'package:aba/core/utils/widgets/abc_title_card.dart';
import 'package:aba/features/challenges/presentation/bloc/challenge_bloc.dart';
import 'package:aba/features/challenges/presentation/view/widgets/challenge_card_item.dart';
import 'package:aba/features/widgets/abc_button.dart';
import 'package:aba/features/widgets/abc_divider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    ChallengeBloc bloc = context.read<ChallengeBloc>();
    return AbcScaffold(
      adaptativeBuilder: (context, type, _) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AbcButton.backButton(
                context: context,
                onPressed: () => context.router.replace(const DashboardRoute()),
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
                onPressed: () => _navigateToCreateNewChallenge(context),
                text: context.intl.challengeButtonCreateChallenge,
              ),
            ),
            const AbcMobileDivider(),
            SizedBox(
              height: context.dimensions.vMargin,
            ),
            BlocBuilder<ChallengeBloc, ChallengeState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is ChallengeLoadedState) {
                  return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.spaceBetween,
                      runSpacing: context.dimensions.vMargin / 2,
                      spacing: context.dimensions.hMargin,
                      children: state.actionsGroupedByName.keys.map((e) {
                        return ChallengeCardItem(
                          items: state.actionsGroupedByName[e]!,
                          onValueChanged: (value) => bloc.add(ChallengeToggleActionEvent(e)),
                        );
                      }).toList());
                }
                if (state is ChallengeErrorState) {
                  Future.microtask(() => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            context.intl.gameErrorMin2,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AbcColors.onError),
                          ),
                          // content: Text(context.intl.gameErrorMin2),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // bloc.add(ChallengeLoadedEvent());
                                },
                                child: Text(context.intl.buttonBack))
                          ],
                        ),
                      ));

                  return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.spaceBetween,
                      runSpacing: context.dimensions.vMargin / 2,
                      spacing: context.dimensions.hMargin,
                      children: state.actionsGroupedByName.keys.map((e) {
                        return ChallengeCardItem(
                          items: state.actionsGroupedByName[e]!,
                          onValueChanged: (value) => bloc.add(ChallengeToggleActionEvent(e)),
                        );
                      }).toList());
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        );
      },
    );
  }
  
  void _navigateToCreateNewChallenge(BuildContext context) {
    context.router.push(const CreateNewChallengeRoute());
  }
}
