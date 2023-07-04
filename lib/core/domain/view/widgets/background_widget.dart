import 'package:abc_fun/core/images.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
          bottom: 0,
          left: 64,
          right: 0,
          top: 0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              Images.starBackground,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
