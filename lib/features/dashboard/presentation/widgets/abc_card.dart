import 'package:aba/core/theme/abc_fun_colors.dart';
import 'package:flutter/material.dart';

class AbcCard extends StatelessWidget {
  const AbcCard({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AbcFunColors.surface,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: AbcFunColors.dropShadow,
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
