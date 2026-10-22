import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routers.detailsScreen);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 10),
        margin: EdgeInsets.all(0.01 * width),
        width: 0.38 * width,
        height: 0.3 * height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorsOFApp.whiteColor,
          image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
