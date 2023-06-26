import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:flutter/material.dart';

class AbcMobileDivider extends StatelessWidget {
  const AbcMobileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptativeScreenBuilder(builder: (context, type) {
      if (type.isHandset) {
        return Padding(
          padding: EdgeInsets.all(context.dimensions.hMargin),
          child: SizedBox(
            width: context.dimensions.maxHorizontalWidth,
            child: const Divider(
              color: Colors.white,
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
