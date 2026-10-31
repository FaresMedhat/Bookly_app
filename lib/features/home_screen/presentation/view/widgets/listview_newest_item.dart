import 'package:bookly_app/core/utils/routers.dart';
import 'package:bookly_app/core/utils/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_item.dart';
import 'package:bookly_app/features/home_screen/presentation/view_models/newest_book_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListViewOfNewestItems extends StatelessWidget {
  const ListViewOfNewestItems({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BlocBuilder<NewestBookCubit, NewestBookCubitState>(
        builder: (context, state) {
          if (state is NewestBookCubitSuccessState) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
                child: SizedBox(
                  height: 0.3 * height,
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
                          width: width,
                          height: height,
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          } else if (state is NewestBookCubitFailureState) {
            return CustomFailureWidget(errorMessege: state.errorMessage);
          } else {
            return CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
