import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/widgets/abc_title_widget.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/widgets/abc_card.dart';
import 'package:flutter/widgets.dart';

class AbcTitleCard extends StatelessWidget {
  const AbcTitleCard({
    super.key,
    this.child,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.descriptionStyle,
    this.direction = Axis.horizontal,
  });

  final String imageUrl;
  final String title;
  final String description;
  final Widget? child;
  final Axis direction;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return AdaptativeScreenBuilder(
      builder: (context, type) {
        bool isHandset = type == AdaptativeScreenType.handset;
        if (isHandset) {
          return AbcCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                AbcTitleWidget.medium(
                  imageUrl: imageUrl,
                  title: title,
                ),
                SizedBox(
                  height: context.dimensions.hMargin,
                ),
                Text(
                  description,
                  style: descriptionStyle,
                ),
                SizedBox(
                  height: context.dimensions.hMargin,
                ),
                child ?? const SizedBox.shrink(),
              ],
            ),
          );
        }
        return Column(
          children: [
            AbcTitleWidget.large(
              imageUrl: imageUrl,
              title: title,
            ),
            SizedBox(
              height: context.dimensions.hMargin,
            ),
            AbcCard(
              padding: const EdgeInsets.all(24),
              child: Flex(direction: type.isHandset ? Axis.vertical : Axis.horizontal, children: [
                Flexible(
                  child: Text(
                    description,
                    style: descriptionStyle,
                  ),
                ),
                SizedBox(
                  width: context.dimensions.hMargin,
                  height: context.dimensions.vMargin,
                ),
                child ?? const SizedBox.shrink(),
              ]),
            ),
          ],
        );
      },
    );
  }
}
