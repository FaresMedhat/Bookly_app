import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 0.05 * width,
          height: 0.02 * height,
          child: Image.asset(AssetsImages.star, fit: BoxFit.fill),
        ),
        Text("4.8", style: Styles.textStyle14),
        SizedBox(width: 0.02 * width),
        Text("(2992)", style: Styles.textStyle14),
      ],
    );
  }
}
