import 'package:flutter/material.dart';

class ReportResultWidgetTitle extends StatelessWidget {
  const ReportResultWidgetTitle({
    super.key,
    required this.imageUrl,
    required this.title,
  });
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 24,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
        )
      ],
    );
  }
}