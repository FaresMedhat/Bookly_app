import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellarListViewItem extends StatelessWidget {
  const BestSellarListViewItem({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routers.detailsScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),

                width: 0.27 * width,
                height: 0.2 * height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorsOFApp.whiteColor,
                  image: DecorationImage(
                    image: AssetImage(AssetsImages.book1),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0.5 * width,
                      child: Text(
                        "Harry Potter and the Goblet of Fire",
                        style: Styles.textStyle20,
                        maxLines: 2,
                      ),
                    ),

                    Text("J.K. Rowling", style: Styles.textStyle14),
                    SizedBox(height: 0.01 * height),
                    Row(
                      children: [
                        Text("19.9 €", style: Styles.textStyle14),
                        SizedBox(width: 0.1 * width),
                        SizedBox(
                          width: 0.05 * width,
                          height: 0.02 * height,
                          child: Image.asset(
                            AssetsImages.star,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text("4.8", style: Styles.textStyle14),
                        SizedBox(width: 0.02 * width),
                        Text("(2992)", style: Styles.textStyle14),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
