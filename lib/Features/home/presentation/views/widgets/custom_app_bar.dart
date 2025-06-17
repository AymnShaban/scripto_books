import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        children: [
          SvgPicture.asset(AssetsData.logo,width: 150,),
          const Spacer(),
          IconButton(
              onPressed: (){},
              icon: SvgPicture.asset(AssetsData.searchIcon,width: 80,)),
        ],
      ),
    );
  }
}
