import 'dart:io';
import 'dart:typed_data';

import 'package:abc_fun/core/domain/view/widgets/abc_button.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_card.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_drop_down.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_scaffold.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_card.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_widget.dart';
import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/navigation/abc_router.gr.dart';
import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/features/account_sync/presentation/domain/model/settings_select_entity.dart';
import 'package:abc_fun/features/game/presentation/view/widgets/game_victory_widget.dart';
import 'package:abc_fun/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
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
            int? selectedActionsPerStage;
            List<SettingsSelectEntity> stageQuantity = _generateStateQuantity(state, context);

            List<SettingsSelectEntity> actionsPerStage = _generateActionsPerStage(state, context);

            if (state is SettingsLoadedState) {
              selectedStageQuantity = state.selectedStageQuantity;
              selectedActionsPerStage = state.selectedActionsPerStage;
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
                  childBellow: Padding(
                    padding: EdgeInsets.only(top: context.dimensions.vMargin),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runAlignment: WrapAlignment.spaceBetween,
                      spacing: context.dimensions.hMargin,
                      runSpacing: context.dimensions.vMargin,
                      children: [
                        AbcDropDown<int>(
                          onSelected: (selected) => _selectStageQuantity(bloc, selected),
                          items: stageQuantity,
                          value: selectedStageQuantity,
                          label: context.intl.settingsPageStagesTitle,
                        ),
                        AbcDropDown<int>(
                          onSelected: (selected) => _selectActionsPerStage(bloc, selected),
                          items: actionsPerStage,
                          value: selectedActionsPerStage,
                          label: context.intl.settingsPageImagesQuantityTitle,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.dimensions.vMargin,
                ),
                AbcCard(
                  padding: EdgeInsets.all(context.dimensions.hMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AbcTitleWidget.medium(
                        imageUrl: Images.rewardIcon,
                        title: context.intl.settingsPageRewardTitle,
                      ),
                      SizedBox(
                        height: context.dimensions.vMargin,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              context.intl.settingsPageRewardDescription,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AbcColors.primary,
                                  ),
                            ),
                          ),
                          if (state is SettingsLoadedState && state.rewardImageBytes == null)
                            AbcButton(
                              text: context.intl.buttonLoadImages,
                              onPressed: () => _loadImages(bloc, context),
                            ),
                        ],
                      ),
                      if (state is SettingsLoadedState && state.rewardImageBytes != null) ...[
                        SizedBox(
                          height: context.dimensions.vMargin * 2,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.memory(
                            Uint8List.fromList(state.rewardImageBytes!),
                          ),
                        ),
                        SizedBox(height: context.dimensions.vMargin),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AbcButton.secondary(
                              text: context.intl.buttonEdit,
                              onPressed: () => _loadImages(bloc, context),
                            ),
                            SizedBox(
                              width: context.dimensions.hMargin,
                            ),
                            AbcButton.secondaryRed(
                              text: context.intl.buttonDelete,
                              onPressed: () => _deleteImage(bloc),
                            )
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<SettingsSelectEntity> _generateActionsPerStage(SettingsState state, BuildContext context) {
    List<SettingsSelectEntity> actionsPerStage = List.generate(
      state.maxActionsPerStage + 1 - state.minActionsPerStage,
      (i) {
        return SettingsSelectEntity(
          name: context.intl.settingsPageImagesQuantity(i + state.minActionsPerStage),
          quantity: i + state.minActionsPerStage,
        );
      },
      growable: false,
    );
    return actionsPerStage;
  }

  List<SettingsSelectEntity> _generateStateQuantity(SettingsState state, BuildContext context) {
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
    return stageQuantity;
  }

  void _selectStageQuantity(SettingsBloc bloc, int? quantity) {
    if (quantity == null) return;
    bloc.add(SettingsStageQuantityEvent(quantity));
  }

  void _selectActionsPerStage(SettingsBloc bloc, int? selected) {
    if (selected == null) return;
    bloc.add(SettingsActionsPerStageEvent(selected));
  }

  Future<void> _loadImages(SettingsBloc bloc, BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'webp', 'png'],
    );
    if (result != null && result.files.isNotEmpty && result.files.first.path != null) {
      bloc.add(
        SettingsRewardImageBytesEvent(
          File(result.files.first.path!).readAsBytesSync(),
        ),
      );
    }
  }

  void _deleteImage(SettingsBloc bloc) {
    bloc.add(
      SettingsRewardImageBytesEvent(null),
    );
  }
}
