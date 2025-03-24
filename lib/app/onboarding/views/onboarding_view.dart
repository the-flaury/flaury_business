import 'package:flaury_business/app/onboarding/views/onboarding_page.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/services/shared_preference_secure_storage.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              OnboardingPage(
                image: onboard1,
                title: 'Grow your business with Flaury',
                subtitle:
                    'Enjoy free management system to optimize your business',
              ),
              OnboardingPage(
                image: onboard2,
                title: 'Easy way to collect payments',
                subtitle:
                    'Enjoy instant payouts to your account and track your income all in one place.',
              ),
              OnboardingPage(
                image: onboard3,
                title: 'Expand your reach with Flaury',
                subtitle:
                    'Showcase your skills and services to thousands of customers.',
                islastImage: true,
              )
            ],
          ),

          //  indicator
          Positioned(
            top: SizeConfig.fromDesignHeight(context, 695),
            left: SizeConfig.fromDesignWidth(context, 160),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 7,
                dotColor: AppColors.primarylight,
                activeDotColor: AppColors.primary,
              ),
            ),
          ),

          // button

          Positioned(
            top: SizeConfig.fromDesignHeight(context, 720),
            left: SizeConfig.fromDesignWidth(context, 30),
            right: SizeConfig.fromDesignWidth(context, 30),
            child: GestureDetector(
              onTap: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeIn,
                );

                if (pageController.page == 2) {
                  debugPrint('this is the final page');
                  Navigator.pushNamed(context, AppRoutes.signup);
                  ref
                      .read(sharedprefrenceProvider)
                      .setBool('hasviewedOnboarding', true);
                }
              },
              child: Container(
                width: SizeConfig.fromDesignWidth(context, 320),
                height: SizeConfig.fromDesignWidth(context, 52),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                    child: AppTextBold(
                  text: 'Continue',
                  fontSize: 16,
                  color: AppColors.white,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
