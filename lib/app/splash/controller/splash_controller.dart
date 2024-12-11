import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/services/navigation_service.dart';

class SplashController {
  static initalizeApp() {
    Future.delayed(const Duration(seconds: 4), () {
      NavigationService().pushReplacement(route: AppRoutes.signup);
    });
  }
}
