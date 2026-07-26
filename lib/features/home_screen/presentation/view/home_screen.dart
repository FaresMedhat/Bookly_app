import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Padding(
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
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
        ],
      ),
    );
  }
}
