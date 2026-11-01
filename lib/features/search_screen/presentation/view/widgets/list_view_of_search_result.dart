import 'package:bookly_app/core/utils/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/best_sellar_listview_item.dart';
import 'package:bookly_app/features/search_screen/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewOfSearchResult extends StatelessWidget {
  const ListViewOfSearchResult({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ListView.builder(
            itemCount: state.books.length,

            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: // ListViewItem(width: width, height: height),
                ListViewItem(
                  width1: width,
                  height1: height,
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchErrorState) {
          return CustomFailureWidget(errorMessege: state.errorMessege);
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }
}
