import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/custom_app_bar_details_screen.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_item.dart';
import 'package:flutter/material.dart';

class DetailsViewScreen extends StatelessWidget {
  const DetailsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsOFApp.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SafeArea(child: CustomAppBarDetailsScreen()),

            ListViewItem(width: 1.3 * width, height: 1.3 * height),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.7 * width,
                    child: Center(
                      child: Text(
                        "Harry Potter and the Goblet of Fire",
                        style: Styles.textStyle30,
                        maxLines: 2,
                      ),
                    ),
                  ),

                  Text("J.K. Rowling", style: Styles.textStyle20),
                  SizedBox(height: 0.01 * height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("19.9 €", style: Styles.textStyle14),
                      SizedBox(width: 0.1 * width),
                      SizedBox(
                        width: 0.05 * width,
                        height: 0.02 * height,
                        child: Image.asset(AssetsImages.star, fit: BoxFit.fill),
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
    );
  }
}
