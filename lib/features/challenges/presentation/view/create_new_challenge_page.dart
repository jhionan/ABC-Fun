import 'package:aba/core/images.dart';
import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/core/utils/widgets/abc_scaffold.dart';
import 'package:aba/core/utils/widgets/abc_title_card.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/challenges/presentation/bloc/challenge_bloc.dart';
import 'package:aba/features/widgets/abc_button.dart';
import 'package:aba/features/widgets/abc_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreateNewChallengePage extends StatefulWidget {
  const CreateNewChallengePage({super.key});

  @override
  State<CreateNewChallengePage> createState() => _CreateNewChallengePageState();
}

class _CreateNewChallengePageState extends State<CreateNewChallengePage> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChallengeBloc bloc = context.read<ChallengeBloc>();

    return AbcScaffold(
      adaptativeBuilder: (context, screenType) {
        bool isHandset = screenType.isHandset;
        Widget body = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.intl.createNewChallengePageActionName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: context.intl.createNewChallengePageActionNameHint,
              ),
            ),
            SizedBox(
              height: context.dimensions.hMargin,
            ),
            if (!isHandset)
              Text(
                context.intl.createNewChallengePageActionImage,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            const SizedBox(
              height: 4,
            ),
            if (isHandset)
              Text(
                context.intl.createNewChallengePageActionImageHint,
                // style: Theme.of(context).textTheme.bodyLarge,
              )
            else
              AbcCard(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    context.intl.createNewChallengePageActionImageHint,
                    // style: Theme.of(context).textTheme.bodyLarge,
                  )),
            SizedBox(
              height: context.dimensions.hMargin,
            ),
            Align(
              alignment: isHandset ? Alignment.center : Alignment.centerLeft,
              child: AbcButton(
                text: context.intl.buttonLoadImages,
                onPressed: () => _selectImages(context),
              ),
            ),
          ],
        );
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AbcButton.backButton(
                context: context,
                onPressed: () => context.router.pop(),
              ),
            ),
            SizedBox(
              height: context.dimensions.vMargin * 2,
            ),
            AbcTitleCard(
              imageUrl: Images.performanceIcon,
              title: context.intl.createNewChallengePageTitle,
              description: context.intl.createNewChallengePageDescription,
              descriptionStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AbcColors.primary,
                  ),
              direction: Axis.vertical,
              child: isHandset ? body : null,
            ),
            SizedBox(
              height: context.dimensions.vMargin,
            ),
            if (!isHandset) body,
          ],
        );
      },
    );
  }

  void _selectImages(BuildContext context) {}
}
