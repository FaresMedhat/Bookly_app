import 'package:bookly_app/core/utils/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/best_sellar_listview_item.dart';
import 'package:bookly_app/features/home_screen/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewOfBestSellarItem extends StatelessWidget {
  const ListViewOfBestSellarItem({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.books.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListViewItem(
                    width1: width,
                    height1: height,
                    book: state.books[index],
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailureState) {
          return CustomFailureWidget(errorMessege: state.errorMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
