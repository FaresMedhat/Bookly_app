import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({super.key, required this.errorMessege});
  final String errorMessege;

  @override
  Widget build(BuildContext context) {
    return Text(errorMessege, style: Styles.textStyle18);
  }
}
