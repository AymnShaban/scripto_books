import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 5),
      child: Row(
        children: [
          SvgPicture.asset(AssetsData.logo, width: 150).animate().flipH(duration: Duration(seconds: 1)).slideY().slideX(),
          const Spacer(),
          IconButton(
            onPressed: () {

            },
            icon: SvgPicture.asset(AssetsData.searchIcon, width: 80),
          ).animate().shake(duration: Duration(seconds: 1)).slideX().slideY(),
        ],
      ),
    );
  }
}
