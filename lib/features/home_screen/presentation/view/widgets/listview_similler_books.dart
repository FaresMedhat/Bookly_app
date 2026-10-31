import 'package:bookly_app/core/utils/routers.dart';
import 'package:bookly_app/core/utils/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_widget.dart';

import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_item.dart';

import 'package:bookly_app/features/home_screen/presentation/view_models/similler_books_cubit/similler_books_cubit.dart';
import 'package:bookly_app/features/home_screen/presentation/view_models/similler_books_cubit/similler_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListViewOfSimilarBooks extends StatefulWidget {
  const ListViewOfSimilarBooks({
    super.key,
    required this.height,
    required this.width,
    required this.category,
  });

  final double height;
  final double width;
  final String category;

  @override
  State<ListViewOfSimilarBooks> createState() => _ListViewOfSimilarBooksState();
}

class _ListViewOfSimilarBooksState extends State<ListViewOfSimilarBooks> {
  void initState() {
    super.initState();
    BlocProvider.of<SimillerBooksCubit>(
      context,
    ).fetchSimillerBooks(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimillerBooksCubit, SimillerBooksState>(
      builder: (context, state) {
        if (state is SimillerBooksSuccessState) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
              child: SizedBox(
                height: 0.3 * widget.height,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    var coverId = state.books[index].thumbnail;

                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          Routers.detailsScreen,
                          extra: state.books[index],
                        );
                      },
                      child: CustomBookingImageWidget(
                        imgUrl: coverId,
                        width: widget.width,
                        height: widget.height,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is SimillerBooksFailureState) {
          return CustomFailureWidget(errorMessege: state.errorMessage);
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }
}
