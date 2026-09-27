import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksButtonActions extends StatelessWidget {
  const BooksButtonActions({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CustomButton(
              height: height,
              title: "19.9 €",
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            CustomButton(
              height: height,
              title: "Free Preview",
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
}
