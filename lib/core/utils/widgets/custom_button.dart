import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    this.color,
    required this.title,
    this.titleColor,
    this.borderRadius,
  });

  final double height;
  final Color? color;
  final String title;
  final Color? titleColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 0.07 * height,

        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: color ?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            ),
          ),
          child: Text(
            title,
            style: Styles.textStyle18.copyWith(
              color: titleColor ?? Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
