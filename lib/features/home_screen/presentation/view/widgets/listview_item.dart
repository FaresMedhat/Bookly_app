import 'package:bookly_app/core/utils/colors.dart';

import 'package:flutter/material.dart';

class CustomBookingImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final String imgUrl;

  const CustomBookingImageWidget({
    super.key,
    required this.width,
    required this.height,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      margin: EdgeInsets.all(0.01 * width),
      width: 0.4 * width,
      height: 0.3 * height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorsOFApp.whiteColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imgUrl,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
