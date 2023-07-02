import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef AdaptativeBuilder = Widget Function(
  BuildContext context,
  AdaptativeScreenType type,
  BoxConstraints constraints,
);

enum AdaptativeScreenType {
  handset(shortestSide: 600),
  tablet(shortestSide: 960),
  desktop(shortestSide: 1280);

  const AdaptativeScreenType({required this.shortestSide});
  final double shortestSide;

  static const double handSetBreakpoint = 600;
  static const double tabletBreakpoint = 960;
  static const double desktopBreakpoint = 1280;
}

extension AdaptativeScreenTypeExt on AdaptativeScreenType {
  bool get isHandset => this == AdaptativeScreenType.handset;
  bool get isTablet => this == AdaptativeScreenType.tablet;
  bool get isDesktop => this == AdaptativeScreenType.desktop;
}

class AdaptativeScreenBuilder extends StatelessWidget {
  const AdaptativeScreenBuilder({super.key, required this.builder});
  final AdaptativeBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = View.of(context).physicalSize.width;
        return switch (screenWidth) {
          <= AdaptativeScreenType.handSetBreakpoint => builder(context, AdaptativeScreenType.handset, constraints),
          <= AdaptativeScreenType.tabletBreakpoint => builder(context, AdaptativeScreenType.tablet, constraints),
          _ => builder(context, AdaptativeScreenType.desktop, constraints)
        };
      },
    );
  }
}
