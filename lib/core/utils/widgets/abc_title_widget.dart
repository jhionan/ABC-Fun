import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:flutter/material.dart';

class AbcTitleWidget extends StatelessWidget {
  const AbcTitleWidget._({
    super.key,
    required this.imageUrl,
    required this.title,
    this.imageSize = 24,
    this.fontSize = 16,
    this.spaceWidth = 4,
  });

  factory AbcTitleWidget.small({
    Key? key,
    required String imageUrl,
    required String title,
  }) {
    return AbcTitleWidget._(
      key: key,
      imageUrl: imageUrl,
      title: title,
      imageSize: 24,
      fontSize: 16,
    );
  }

  factory AbcTitleWidget.medium({
    Key? key,
    required String imageUrl,
    required String title,
  }) {
    return AbcTitleWidget._(
      key: key,
      imageUrl: imageUrl,
      title: title,
      imageSize: 32,
      fontSize: 20,
      spaceWidth: 8,
    );
  }

  factory AbcTitleWidget.large({Key? key, required String imageUrl, required String title}) {
    return AbcTitleWidget._(
      key: key,
      imageUrl: imageUrl,
      title: title,
      imageSize: 74,
      fontSize: 40,
      spaceWidth: 16,
    );
  }

  final String imageUrl;
  final String title;
  final double imageSize;
  final double fontSize;
  final double spaceWidth;

  @override
  Widget build(BuildContext context) {
    return AdaptativeScreenBuilder(builder: (context, screenType, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: imageSize,
          ),
          SizedBox(
            width: spaceWidth,
          ),
          Text(title,
              style: TextStyle(
                fontSize: fontSize,
              ))
        ],
      );
    });
  }
}
