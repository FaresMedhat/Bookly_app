import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.all(5),
      width: 0.38 * width,
      height: 0.3 * height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorsOFApp.whiteColor,
        image: DecorationImage(
          image: AssetImage(AssetsImages.book1),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Image.asset(AssetsImages.logo, height: 18, fit: BoxFit.contain),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: ColorsOFApp.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

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
    return Padding(
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
    );
  }
}
