import 'package:bookly_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFeildOfSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final VoidCallback onIconPressed;
  const TextFeildOfSearchBar({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onIconPressed,
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
