import 'package:flaury_business/app/authentication/views/sign_in._view.dart';
import 'package:flaury_business/app/authentication/views/sign_up_view.dart';
import 'package:flaury_business/app/authentication/views/verification_views.dart';
import 'package:flaury_business/app/onboarding/views/onboarding_view.dart';
import 'package:flaury_business/app/splash/views/splash_view.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flutter/material.dart';

class AppPages {
  static String inital = AppRoutes.splash;
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          settings: settings,
        );
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
          settings: settings,
        );
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
          settings: settings,
        );
      case AppRoutes.signin:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
          settings: settings,
        );
      case AppRoutes.verification:
        return MaterialPageRoute(
          builder: (_) => const VerificationView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: AppTextBold(
                text: 'opps nothing here ',
                fontSize: 12,
              ),
            ),
          ),
        );
    }
  }
}
