import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            Image.asset(AssetsImages.logo, height: 18, fit: BoxFit.contain),
            Spacer(),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(Routers.searchScreen);
              },
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: ColorsOFApp.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
