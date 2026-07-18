import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/utils/assets_images.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/features/home_screen/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> textAimation;
  @override
  void initState() {
    super.initState();
    slidingAnimation();
    navToHomePage();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: ColorsOFApp.primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AssetsImages.logo,
              width: 50,
              height: 70,
              fit: BoxFit.contain,
            ),
            SlideTransition(
              position: textAimation,

              child: Text(
                "Read Free Books",
                style: TextStyle(
                  color: ColorsOFApp.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navToHomePage() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
        () => const HomeScreen(),
        transition: Transition.fadeIn,
        duration: Constants.normalDuration,
      );
    });
  }

  void slidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animationController.forward();
    textAimation = Tween<Offset>(
      begin: const Offset(0, 7),
      end: Offset.zero,
    ).animate(animationController);
    textAimation.addListener(() {
      setState(() {});
    });
  }
}
