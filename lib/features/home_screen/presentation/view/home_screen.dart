import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/colors.dart';

import 'package:bookly_app/features/home_screen/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_featured_item.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_of_best_sellar_items.dart';
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
      backgroundColor: ColorsOFApp.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),

                ListViewOfNewestItems(height: height, width: width),
                Text("  Best Sellar", style: Styles.textStyle20),
                SizedBox(height: 0.01 * height),
              ],
            ),
          ),
          SliverFillRemaining(
            child: ListViewOfBestSellarItem(width: width, height: height),
          ),
        ],
      ),
    );
  }
}
