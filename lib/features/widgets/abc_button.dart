import 'package:aba/core/theme/abc_colors.dart';
import 'package:flutter/material.dart';

class AbcButton extends StatelessWidget {
  const AbcButton({super.key, required this.text, this.onPressed, this.minWidth, this.maxWidth});
  final String text;
  final VoidCallback? onPressed;
  final double? minWidth;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(AbcColors.onPrimary),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AbcColors.primary.withOpacity(0.5);
          }
          if (states.contains(MaterialState.hovered)) {
            return AbcColors.primary.withOpacity(0.9);
          }
          return AbcColors.primary;
        }),
        maximumSize: MaterialStateProperty.all<Size>(Size(maxWidth ?? double.infinity, 59)),
        minimumSize: MaterialStateProperty.all<Size>(Size(minWidth ?? 173, 59)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
