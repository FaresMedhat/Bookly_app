import 'package:bookly_app/features/home_screen/presentation/view/widgets/best_sellar_listview_item.dart';
import 'package:flutter/material.dart';

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
    return ListView.builder(
      itemCount: 10,

      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: // ListViewItem(width: width, height: height),
          Text(
            "Data",
          ),
        );
      },
    );
  }
}
