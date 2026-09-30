import 'package:bookly_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFeildOfSearchBar extends StatelessWidget {
  const TextFeildOfSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: ColorsOFApp.whiteColor,
          ),
        ),
        hintText: "Search",
        enabledBorder: buildOutLineInputBorder(),
        focusedBorder: buildOutLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
