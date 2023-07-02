import 'package:aba/core/navigation/abc_router.gr.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/core/utils/widgets/abc_button.dart';
import 'package:aba/core/utils/widgets/abc_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayCard extends StatelessWidget {
  const PlayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AbcCard(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: AdaptativeScreenBuilder(builder: (context, type, _) {
        Text playCard = Text(
          AppLocalizations.of(context).playCardDescription,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        );
        return Flex(
          direction: type.isHandset ? Axis.vertical : Axis.horizontal,
          children: [
            if (type.isHandset) playCard else Flexible(child: playCard),
            SizedBox(
              width: context.dimensions.hMargin,
              height: context.dimensions.vMargin,
            ),
            AbcButton(
              text: AppLocalizations.of(context).playCardButton,
              onPressed: () => _navigateToGame(context),
              minWidth: type.isHandset ? double.infinity : null,
            ),
          ],
        );
      }),
    );
  }

  void _navigateToGame(BuildContext context) {
    context.router.push(const GameRoute());
  }
}
