import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';

import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.width,
    required this.height,
    required this.book,
  });

  final double width;
  final double height;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 0.7 * width,

            child: Text(
              book.title,
              style: Styles.textStyle30,
              textAlign: TextAlign.center,
            ),
          ),

          Text(book.authors.first, style: Styles.textStyle20),
          SizedBox(height: 0.01 * height),
        ],
      ),
    );
  }
}
