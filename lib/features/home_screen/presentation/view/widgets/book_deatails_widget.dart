import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

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

            child: Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                "Harry Potter and the Goblet of Fire",
                style: Styles.textStyle30,
                maxLines: 2,
              ),
            ),
          ),

          Text("J.K. Rowling", style: Styles.textStyle20),
          SizedBox(height: 0.01 * height),
        ],
      ),
    );
  }
}
