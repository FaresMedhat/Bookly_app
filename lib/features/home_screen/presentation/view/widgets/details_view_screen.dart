import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/custom_app_bar_details_screen.dart';
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
        child: Column(children: [SafeArea(child: CustomAppBarDetailsScreen())]),
      ),
    );
  }
}
