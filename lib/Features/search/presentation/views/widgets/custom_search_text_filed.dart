import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({super.key, required this.onChanged});

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: buildTextStyle(),
      onSubmitted: onChanged,

      decoration: InputDecoration(
        hintText: "Search",
        counterText: 'Write what you want with out space at the end',
        counterStyle: buildTextStyle().copyWith(fontSize: 12),
        hintStyle: buildTextStyle(),
        suffixIcon: SvgPicture.asset(AssetsData.searchIcon, width: 70),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  TextStyle buildTextStyle() {
    return TextStyle(
      color: kGoldenColor,
      fontFamily: kMoFontFamily,
      fontSize: 20,
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kGoldenColor),
    );
  }
}
