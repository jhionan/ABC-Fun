import 'package:aba/core/images.dart';
import 'package:aba/core/navigation/abc_router.gr.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:aba/core/utils/widgets/abc_scaffold.dart';
import 'package:aba/core/utils/widgets/abc_title_card.dart';
import 'package:aba/features/widgets/abc_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbcScaffold(
      adaptativeBuilder: (context, screenType, _) {
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
              title: context.intl.aboutPageTitle,
              description: context.intl.aboutPageDescription,
              descriptionStyle: Theme.of(context).textTheme.bodyLarge,
              imageUrl: Images.supportIcon,
              direction: Axis.horizontal,
            )
          ],
        );
      },
    );
  }
}
