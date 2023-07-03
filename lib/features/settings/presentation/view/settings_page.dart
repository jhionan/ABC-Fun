import 'package:abc_fun/core/domain/view/widgets/abc_button.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_drop_down.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_scaffold.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_card.dart';
import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/navigation/abc_router.gr.dart';
import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_select_entity.dart';
import 'package:abc_fun/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsBloc bloc = context.read<SettingsBloc>();
    return AbcScaffold(
      adaptativeBuilder: (context, screenType, _) {
        return BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            int? selectedStageQuantity;
            List<SettingsSelectEntity> stageQuantity = List.generate(
              state.maxStageQuantity,
              (i) {
                return SettingsSelectEntity(
                  name: context.intl.settingsPageStages(i + 1),
                  quantity: i + 1,
                );
              },
              growable: false,
            );

            if(state is SettingsLoadedState) {
              selectedStageQuantity = state.selectedStageQuantity;
            }

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
                  title: context.intl.settingsPageTitle,
                  description: context.intl.settingsPageDescription,
                  descriptionStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AbcColors.primary,
                      ),
                  imageUrl: Images.settingsIcon,
                  childBellow: Wrap(
                    children: [
                      AbcDropDown<int>(
                        onSelected: (selected) {
                          if (selected != null) {
                            bloc.add(SettingsStageQuantityEvent(selected));
                          }
                        },
                        items: stageQuantity,
                        value: selectedStageQuantity,
                        label: '',
                      )
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
