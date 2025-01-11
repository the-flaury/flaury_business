import 'package:flaury_business/app/authentication/views/create_new_password.dart';
import 'package:flaury_business/app/authentication/views/enter_otp_view.dart';
import 'package:flaury_business/app/authentication/views/forgot_password_view.dart';
import 'package:flaury_business/app/authentication/views/sign_in._view.dart';
import 'package:flaury_business/app/authentication/views/sign_up_view.dart';
import 'package:flaury_business/app/authentication/views/verification_views.dart';
import 'package:flaury_business/app/dashboard/views/dashboard_view.dart';
import 'package:flaury_business/app/home/views/manage_promotions_view.dart';
import 'package:flaury_business/app/home/views/manage_service_view.dart';
import 'package:flaury_business/app/home/views/transaction_view.dart';
import 'package:flaury_business/app/no_internet/views/no_internet_view.dart';
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

      case AppRoutes.changepassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
          settings: settings,
        );

      case AppRoutes.otp:
        return MaterialPageRoute(
          builder: (_) => const EnterOtpView(),
          settings: settings,
        );
      case AppRoutes.enterNewPassword:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordView(),
          settings: settings,
        );
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardView(),
          settings: settings,
        );

      case AppRoutes.noInternet:
        return MaterialPageRoute(
          builder: (_) => const NoInternetView(),
          settings: settings,
        );

      case AppRoutes.managePromotons:
        return MaterialPageRoute(
          builder: (_) => const ManagePromotionsView(),
          settings: settings,
        );

      case AppRoutes.manageServices:
        return MaterialPageRoute(
          builder: (_) => const ManageServiceView(),
          settings: settings,
        );

      case AppRoutes.transactions:
        return MaterialPageRoute(
          builder: (_) => const TransactionView(),
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
