import 'package:bookly_app/features/home_screen/presentation/view/widgets/listview_item.dart';
import 'package:flutter/material.dart';

class ListViewOfFeaturedItems extends StatelessWidget {
  const ListViewOfFeaturedItems({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
        child: SizedBox(
          height: 0.3 * height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ListViewItem(width: width, height: height);
            },
          ),
        ),
      ),
    );
  }
}
