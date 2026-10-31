import 'package:bookly_app/core/functions/custom_url_luncher.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/widgets/custom_button.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:flutter/material.dart';

class BooksButtonActions extends StatelessWidget {
  const BooksButtonActions({
    super.key,
    required this.height,
    required this.book,
  });

  final double height;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CustomButton(
              onPressed: () {
                if (book.saleability == "FOR_SALE") {
                  customUrlLuncher(book.buyLink, context);
                } else if (book.saleability == "FREE" &&
                    book.downloadLink.isNotEmpty) {
                  customUrlLuncher(book.downloadLink, context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('This book is not available for purchase.'),
                    ),
                  );
                }
              },
              height: height,
              title: getTextOfBuyBook(),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            CustomButton(
              onPressed: () {
                customUrlLuncher(book.bookUrl, context);
              },
              height: height,
              title: getTextOfReadBook(),
              color: ColorsOFApp.lightRedColor,
              titleColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTextOfReadBook() {
    if (book.isPdfAvailable) {
      return "Preview";
    }
    return "Not Available";
  }

  String getTextOfBuyBook() {
    if (book.saleability == "FOR_SALE") {
      return "Buy";
    } else if (book.saleability == "FREE") {
      return "Free";
    }
    return "Not Available";
  }
}
