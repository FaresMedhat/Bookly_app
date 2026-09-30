import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/best_sellar_listview_item.dart';
import 'package:bookly_app/features/search_screen/presentation/view/widgets/list_view_of_search_result.dart';
import 'package:bookly_app/features/search_screen/presentation/view/widgets/text_feild_of_search_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsOFApp.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            TextFeildOfSearchBar(),
            SizedBox(height: 0.04 * height),
            Text("Search Result", style: Styles.textStyle16),
            SizedBox(height: 0.02 * height),
            Expanded(
              child: ListViewOfSearchResult(width: width, height: height),
            ),
          ],
        ),
      ),
    );
  }
}
