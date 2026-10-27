import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 0.05 * width,
          height: 0.02 * height,
          child: Image.asset(AssetsImages.star, fit: BoxFit.fill),
        ),
        Text(book.averageRating.toString(), style: Styles.textStyle14),
        SizedBox(width: 0.02 * width),
        Text("(${book.ratingsCount})", style: Styles.textStyle14),
      ],
    );
  }
}
