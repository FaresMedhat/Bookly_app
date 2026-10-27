import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/core/utils/assets_images.dart';

import 'package:bookly_app/core/utils/routers.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.width1,
    required this.height1,
    required this.book,
  });

  final double width1;
  final double height1;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routers.detailsScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),

                width: 0.3 * width1,
                height: 0.22 * height1,
                child: CustomBookingImageWidget(
                  width: 0.4 * width1,
                  height: 0.3 * height1,
                  imgUrl: book.thumbnail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0.5 * width1,
                      child: Text(
                        book.title,
                        style: Styles.textStyle20,
                        maxLines: 2,
                      ),
                    ),

                    SizedBox(
                      width: 0.5 * width1,
                      child: Text(
                        book.authors.first,
                        style: Styles.textStyle14,
                        maxLines: 2,
                      ),
                    ),

                    SizedBox(height: 0.01 * height1),
                    Row(
                      children: [
                        Text("Free", style: Styles.textStyle14),
                        SizedBox(width: 0.1 * width1),
                        SizedBox(
                          width: 0.05 * width1,
                          height: 0.02 * height1,
                          child: Image.asset(
                            AssetsImages.star,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text("4.8", style: Styles.textStyle14),
                        SizedBox(width: 0.02 * width1),
                        Text(
                          "(${book.ratingsCount})",
                          style: Styles.textStyle14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
