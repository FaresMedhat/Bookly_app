import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),

          ListViewOfFeaturedItems(height: height, width: width),
          Text("Best Sellar", style: Styles.mediumTitle),
        ],
      ),
    );
  }
}
