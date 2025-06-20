import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/core/utils/app_router.dart';
import 'package:scripto_books/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    // here we followed the first principle "Single responsibility principle"
    // no a lot of code for methods just we called the method name
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlideTransition(
            position: slidingAnimation,
            child: SvgPicture.asset(AssetsData.logo, width: 470),
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 3),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {});
    });
    @override
    void dispose() {
      super.dispose();
      animationController.dispose();
    }
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), ()  {
      // Get.to(
      //   () => HomeView(),
      //   transition: Transition.zoom,
      //   duration: kTransitionDuration,
      // );

      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
