import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/routes/navigator_helper.dart';

class SplashController {
  static initalizeApp() {
    Future.delayed(const Duration(seconds: 4), () {
      NavigatorHelper.pushTo(route: AppRoutes.onboarding);
    });
  }
}
