import 'package:flaury_business/routes/app_pages.dart';
import 'package:flaury_business/routes/navigator_helper.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.inital,
        onGenerateRoute: AppPages.onGenerateRoutes,
        navigatorKey: NavigatorHelper.navigatorKey,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
        ));
  }
}
