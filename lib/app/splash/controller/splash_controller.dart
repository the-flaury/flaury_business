import 'dart:async';

import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/services/shared_preference_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashController {
  static initalizeApp(WidgetRef ref) {
    final navigaton = ref.watch(navigationServiceProvider);
    Timer(const Duration(seconds: 6), () async {
      bool? onboardingStatus = await ref
          .read(sharedprefrenceProvider)
          .getBool('hasviewedOnboarding');
      bool hasSeenOnboarding = onboardingStatus == true;

      if (hasSeenOnboarding) {
        navigaton.pushReplacement(route: AppRoutes.signin);
      } else {
        navigaton.pushReplacement(route: AppRoutes.onboarding);
      }
    });
  }
}
