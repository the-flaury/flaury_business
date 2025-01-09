import 'package:flaury_business/app/no_internet/notifiers/internet_connectivity_notifier.dart';
import 'package:flaury_business/routes/app_pages.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/routes/navigator_helper.dart';
import 'package:flaury_business/services/connectivity_check_service.dart';
import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorhelper = ref.watch(navigatorhelperProvider);
    final navigation = ref.watch(navigationServiceProvider);

    //initalize the internet connectivity service checker here on the start of of application
    ref.watch(internetConnectivityCheckerServiceProvider);

    // this listens to our internet connection state and shows  the appropriate screen depending on if theres internet or not
    ref.listen<ConnectivityStatus>(connectionProvider, (prev, next) {
      debugPrint('Connectivity state changed: $next');

      if (next == ConnectivityStatus.disconnected) {
        // Navigate to the No Internet page when disconnected
        navigation.pushReplacement(route: AppRoutes.noInternet);
      } else if (next == ConnectivityStatus.connected) {
        // Navigate back when the internet is back
        navigation.pop();
      }
    });
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.inital,
        onGenerateRoute: AppPages.onGenerateRoutes,
        navigatorKey: navigatorhelper.navigatorKey,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
        ));
  }
}
