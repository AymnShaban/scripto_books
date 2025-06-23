import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/core/utils/app_router.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 5),
      child:
          Row(
            children: [
              SvgPicture.asset(AssetsData.logo, width: 150),
              const Spacer(),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSearchView);
                },
                icon: SvgPicture.asset(AssetsData.searchIcon, width: 70),
              ).animate(),
            ],
          ).animate().slideY(duration: Duration(seconds: 1)).slideX(),
    );
  }
}
