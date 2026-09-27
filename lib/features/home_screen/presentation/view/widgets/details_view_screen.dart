import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/book_deatails_widget.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/custom_app_bar_details_screen.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_item.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/rating_section_widget.dart';
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

            CustomBookingImageWidget(width: 1.3 * width, height: 1.3 * height),
            BookDetailsSection(width: width, height: height),
            RatingSection(width: width, height: height),
          ],
        ),
      ),
    );
  }
}
