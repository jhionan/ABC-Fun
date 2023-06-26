import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/utils/extensions/context_ext.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AbcButton extends StatelessWidget {
  const AbcButton._({
    super.key,
    required this.text,
    this.onPressed,
    this.minWidth,
    this.maxWidth,
    this.icon,
    this.height = 59,
    this.backgroundColor = AbcColors.primary,
    this.foregroundColor = AbcColors.onPrimary,
  });
  factory AbcButton({Key? key, required String text, VoidCallback? onPressed, double? minWidth, double? maxWidth}) =>
      AbcButton._(
        key: key,
        text: text,
        onPressed: onPressed,
        minWidth: minWidth,
        maxWidth: maxWidth,
      );

  factory AbcButton.secondary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? minWidth,
    double? maxWidth,
    IconData? icon,
  }) {
    return AbcButton._(
      key: key,
      text: text,
      onPressed: onPressed,
      minWidth: minWidth ?? 99,
      maxWidth: maxWidth,
      icon: icon,
      height: 48,
      backgroundColor: AbcColors.secondary,
      foregroundColor: AbcColors.onSecondary,
    );
  }

  factory AbcButton.backButton({
    VoidCallback? onPressed,
    required BuildContext context,
  }) {
    return AbcButton._(
      text: context.intl.buttonBack,
      onPressed: onPressed ?? context.router.pop,
      minWidth: 99,
      icon: Icons.arrow_back_sharp,
      height: 48,
      backgroundColor: AbcColors.secondary,
      foregroundColor: AbcColors.onSecondary,
    );
  }

  final String text;
  final VoidCallback? onPressed;
  final double? minWidth;
  final double? maxWidth;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return backgroundColor.withOpacity(0.5);
          }
          if (states.contains(MaterialState.hovered)) {
            return backgroundColor.withOpacity(0.9);
          }
          return backgroundColor;
        }),
        maximumSize: MaterialStateProperty.all<Size>(Size(maxWidth ?? double.infinity, height)),
        minimumSize: MaterialStateProperty.all<Size>(Size(minWidth ?? 173, height)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
