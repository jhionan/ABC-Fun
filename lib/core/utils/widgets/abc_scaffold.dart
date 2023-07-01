import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/widgets/background_widget.dart';
import 'package:flutter/material.dart';

class AbcScaffold extends StatelessWidget {
  const AbcScaffold({
    super.key,
    required this.adaptativeBuilder,
  });

  final AdaptativeBuilder adaptativeBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: AdaptativeScreenBuilder(
        builder: (context, type, _) {
          bool isHandset = type == AdaptativeScreenType.handset;
          return BackgroundWidget(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: context.dimensions.vMargin),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(context.dimensions.hMargin),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isHandset ? context.dimensions.max2ColumnsWidth / 2 : context.dimensions.max2ColumnsWidth,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return adaptativeBuilder(context, type, constraints);
                      }
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
