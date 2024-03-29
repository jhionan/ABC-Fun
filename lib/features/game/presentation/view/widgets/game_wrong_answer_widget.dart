import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_card.dart';
import 'package:flutter/material.dart';

class GameWrongAnswerWidget extends StatelessWidget {
  const GameWrongAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(2 * context.dimensions.hMargin),
        child: AbcCard(
          padding: EdgeInsets.all(context.dimensions.hMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Text(
                context.intl.gameWrongAnswer,
                style: context.textTheme.displayMedium?.copyWith(
                  color: AbcColors.onError,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
