import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/domain/view/widgets/adaptative_screen_builder.dart';
import 'package:abc_fun/core/domain/view/widgets/background_widget.dart';
import 'package:flutter/material.dart';

class AbcScaffold extends StatelessWidget {
  const AbcScaffold({super.key, required this.adaptativeBuilder, this.scrollable = true});

  final AdaptativeBuilder adaptativeBuilder;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: AdaptativeScreenBuilder(
        builder: (context, type, _) {
          bool isHandset = type == AdaptativeScreenType.handset;
          return BackgroundWidget(
            child: SingleChildScrollView(
              physics: scrollable ? null : const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: context.dimensions.vMargin),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(context.dimensions.hMargin),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth:
                          isHandset ? context.dimensions.max2ColumnsWidth / 2 : context.dimensions.max2ColumnsWidth,
                    ),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return adaptativeBuilder(context, type, constraints);
                    }),
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
