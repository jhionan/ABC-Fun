import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_title_widget.dart';
import 'package:abc_fun/core/domain/view/widgets/adaptative_screen_builder.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_card.dart';
import 'package:flutter/widgets.dart';

class AbcTitleCard extends StatelessWidget {
  const AbcTitleCard({
    super.key,
    this.child,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.descriptionStyle,
    this.direction = Axis.vertical,
  });

  final String imageUrl;
  final String title;
  final String? description;
  final Widget? child;
  final Axis direction;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return AdaptativeScreenBuilder(
      builder: (context, type, _) {
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
                if (description != null)
                  Text(
                    description!,
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
              child: Row(children: [
                if (description != null)
                  Flexible(
                    child: Text(
                      description!,
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
