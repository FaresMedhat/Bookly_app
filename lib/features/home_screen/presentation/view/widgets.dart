import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.all(5),
      width: 0.38 * width,
      height: 0.3 * height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorsOFApp.whiteColor,
        image: DecorationImage(
          image: AssetImage(AssetsImages.book1),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
