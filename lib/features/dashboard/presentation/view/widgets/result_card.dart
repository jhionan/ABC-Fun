import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:abc_fun/core/domain/view/widgets/abc_card.dart';
import 'package:flutter/material.dart';

enum ResultCardType {
  large,
  standard,
}

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.result,
    this.type = ResultCardType.standard,
  });
  final String imageUrl;
  final String text;
  final double result;
  final ResultCardType type;

  @override
  Widget build(BuildContext context) {
    return AbcCard(
      padding: EdgeInsets.only(
        top: getPaddingByType(context),
        bottom: getPaddingByType(context),
        left: getPaddingByType(context),
        right: 32,
      ),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                width: getImageSizeByType(),
                height: getImageSizeByType(),
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                result.round().toString(),
                style: TextStyle(
                  fontSize: getResultFontSizeByType(),
                  color: AbcColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double getResultFontSizeByType() {
    return switch (type) { ResultCardType.large => 50.0, ResultCardType.standard => 30.0 };
  }

  double getImageSizeByType() {
    return switch (type) { ResultCardType.large => 55.0, ResultCardType.standard => 40.0 };
  }

  double getPaddingByType(BuildContext context) {
    return switch (type) {
      ResultCardType.large => context.dimensions.hMargin,
      ResultCardType.standard => context.dimensions.hMargin / 2
    };
  }
}
