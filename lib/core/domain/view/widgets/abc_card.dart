import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:flutter/material.dart';

class AbcCard extends StatelessWidget {
  const AbcCard({super.key, required this.child, this.onTap, this.padding, this.hideCard = false});

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final bool hideCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: hideCard
          ? child
          : Container(
              padding: padding,
              decoration: const BoxDecoration(
                color: AbcColors.surface,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: AbcColors.dropShadow,
                    blurRadius: 25,
                    offset: Offset(0, 20),
                  ),
                ],
              ),
              child: child,
            ),
    );
  }
}
