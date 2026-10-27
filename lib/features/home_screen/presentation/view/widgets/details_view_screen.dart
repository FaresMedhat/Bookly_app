import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/book_deatails_widget.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/books_button_action.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/custom_app_bar_details_screen.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_featured_item.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_item.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/rating_section_widget.dart';
import 'package:flutter/material.dart';

class DetailsViewScreen extends StatelessWidget {
  const DetailsViewScreen({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsOFApp.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(child: CustomAppBarDetailsScreen()),

              CustomBookingImageWidget(
                width: 1.3 * width,
                height: 1.05 * height,
                imgUrl: book.thumbnail,
              ),
              SizedBox(height: 0.06 * height),
              BookDetailsSection(width: width, height: height, book: book),
              RatingSection(width: width, height: height, book: book),
              SizedBox(height: 0.037 * height),
              BooksButtonActions(height: height),
              SizedBox(height: 0.02 * height),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text("You can also like", style: Styles.textStyle16),
              ),
              SizedBox(height: 0.01 * height),
              ListViewOfNewestItems(height: 0.8 * height, width: 0.9 * width),
            ],
          ),
        ),
      ),
    );
  }
}
