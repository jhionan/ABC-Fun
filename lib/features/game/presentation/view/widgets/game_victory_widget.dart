import 'dart:io';
import 'dart:math';

import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/utils/extensions/context_ext.dart';
import 'package:abc_fun/core/domain/view/widgets/adaptative_screen_builder.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_card.dart';
import 'package:abc_fun/core/domain/view/widgets/background_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GameVictoryWidget extends StatelessWidget {
  const GameVictoryWidget({super.key, this.imageData});
  final Uint8List? imageData;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: EdgeInsets.all(context.dimensions.hMargin * 2),
        child: AdaptativeScreenBuilder(builder: (context, type, constraints) {
          double maxImageWidth = min(constraints.maxWidth * 0.25, 200);
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              if (imageData != null)
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.file(
                      File.fromRawPath(imageData!),
                      fit: BoxFit.cover,
                    )),
              Center(
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
                        context.intl.gameVictory,
                        style: context.textTheme.displayMedium?.copyWith(
                          color: AbcColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (imageData == null)
                Positioned(
                  left: 2 * context.dimensions.hMargin,
                  bottom: (constraints.maxHeight / 2) - maxImageWidth / 2 + (type.isHandset ? 50.0 : 0),
                  child: Image.asset(
                    Images.totalAverangeSuccessResults,
                    width: maxImageWidth,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              if (imageData == null)
                Positioned(
                  right: 2 * context.dimensions.hMargin,
                  bottom: (constraints.maxHeight / 2) - maxImageWidth - (type.isHandset ? 30.0 : 0),
                  child: Image.asset(
                    Images.totalChallengesResults,
                    width: maxImageWidth,
                    fit: BoxFit.fitWidth,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
