import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/search_screen/presentation/view/widgets/list_view_of_search_result.dart';
import 'package:bookly_app/features/search_screen/presentation/view/widgets/text_feild_of_search_bar.dart';
import 'package:bookly_app/features/search_screen/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

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
            TextFeildOfSearchBar(
              onChanged: (value) {
                // 1. حفظ النص الذي يكتبه المستخدم فوراً
                query = value;
              },
              onSubmitted: (value) {
                // 2. البحث عند الضغط على زر (Enter/Search) في الكيبورد
                if (value.trim().isNotEmpty) {
                  BlocProvider.of<SearchCubit>(
                    context,
                  ).fetchSearchedBooks(value);
                }
              },
              onIconPressed: () {
                // 3. البحث عند الضغط على أيقونة العدسة المكبرة
                if (query.trim().isNotEmpty) {
                  BlocProvider.of<SearchCubit>(
                    context,
                  ).fetchSearchedBooks(query);
                }
              },
            ),
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
