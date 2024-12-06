import 'package:flaury_business/app/splash/controller/splash_controller.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashController.initalizeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: const SvgAssets(svg: logo)
                .animate() // Apply the animation
                .slide(
                    begin: const Offset(0, 1),
                    end: const Offset(0, 0),
                    curve: Curves.easeInOut)
                .fadeIn(duration: 3.seconds),
          )
        ],
      ),
    );
  }
}
