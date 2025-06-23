import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: buildTextStyle(),
      onChanged: (data) {},

      decoration: InputDecoration(
        hintText: "Search",
        counterText: 'The result is 30 Books',
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
