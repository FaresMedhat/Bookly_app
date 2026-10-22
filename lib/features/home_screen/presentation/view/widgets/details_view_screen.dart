import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/book_deatails_widget.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/books_button_action.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/custom_app_bar_details_screen.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_featured_item.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(child: CustomAppBarDetailsScreen()),

              CustomBookingImageWidget(
                width: 1.3 * width,
                height: 1.05 * height,
                imgUrl:
                    "https://www.google.com/search?sca_esv=2351a38461d14f4c&rlz=1C1GCEU_enEG1078EG1094&sxsrf=APpeQnsBehth88vQCRz-Q-RBXjl1JB-SrA:1792664651977&q=%D9%87%D8%A7%D8%B1%D9%8A+%D8%A8%D9%88%D8%AA%D8%B1+%D9%88%D8%AD%D8%AC%D8%B1+%D8%A7%D9%84%D9%81%D9%8A%D9%84%D8%B3%D9%88%D9%81&stick=H4sIAAAAAAAAAONgFuLUz9U3MLdISytX4gAxk-PLsrXkspOt9JPy87P1czJLUosSiyrji1OLMlOLrUCCxYtYtW-231h-Y-PNLoUbK2523Fh1Y6MCkFp7Yw2QcWP5zZabjTe7brbc2Hyz42YjAPyUrSBlAAAA&sa=X&ved=2ahUKEwiX3KCetM2XAxV53QIHHTdBDUwQgOQBegQIIhAG",
              ),
              SizedBox(height: 0.06 * height),
              BookDetailsSection(width: width, height: height),
              RatingSection(width: width, height: height),
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
