import 'package:flutter/widgets.dart';

class DimensionsProvider extends InheritedWidget {
  const DimensionsProvider({super.key, required super.child, required this.dimensions});
  final Dimensions dimensions;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return dimensions != (oldWidget as DimensionsProvider).dimensions;
  }

  static DimensionsProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DimensionsProvider>()!;
  }
}

extension DimensionsEx on BuildContext {
  Dimensions get dimensions => DimensionsProvider.of(this).dimensions;
}

class Dimensions {
  Dimensions._({
    required this.hMargin,
    required this.vMargin,
    required this.borderRadius,
    required this.textFieldBorderRadius,
    required this.standartCardHeight,
    required this.bigCardHeight,
    required this.maxHorizontalWidth,
    required this.max2ColumnsWidth
  });

  factory Dimensions.handSet() {
    return Dimensions._(
      hMargin: 16,
      vMargin: 16,
      borderRadius: 16,
      textFieldBorderRadius: 200,
      standartCardHeight: 64,
      bigCardHeight: 96,
      maxHorizontalWidth: 338,
      max2ColumnsWidth: 725
    );
  }

  factory Dimensions.biggerScreens() {
    return Dimensions._(
      hMargin: 24,
      vMargin: 24,
      borderRadius: 16,
      textFieldBorderRadius: 200,
      standartCardHeight: 64,
      bigCardHeight: 96,
      maxHorizontalWidth: 338,
      max2ColumnsWidth: 725
    );
  }

  final double hMargin;
  final double vMargin;
  final double borderRadius;
  final double textFieldBorderRadius;
  final double standartCardHeight;
  final double bigCardHeight;
  final double maxHorizontalWidth;
  final double max2ColumnsWidth;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dimensions &&
        other.hMargin == hMargin &&
        other.vMargin == vMargin &&
        other.borderRadius == borderRadius &&
        other.textFieldBorderRadius == textFieldBorderRadius &&
        other.standartCardHeight == standartCardHeight &&
        other.bigCardHeight == bigCardHeight;
  }

  @override
  int get hashCode {
    return hMargin.hashCode ^
        vMargin.hashCode ^
        borderRadius.hashCode ^
        textFieldBorderRadius.hashCode ^
        standartCardHeight.hashCode ^
        bigCardHeight.hashCode;
  }
}
