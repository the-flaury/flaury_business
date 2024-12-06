import 'package:flutter/material.dart';

class NavigatorHelper {
  GlobalKey<ScaffoldMessengerState> scafflodMessangerKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static dynamic pushTo({
    dynamic arguments,
    Widget? page,
    String? route,
  }) {
    if (route != null) {
      navigatorKey.currentState
          ?.pushReplacementNamed(route, arguments: arguments);
    } else if (page != null) {
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      throw ArgumentError('Either routeName or page must be provided.');
    }
  }

  static dynamic pop() {
    navigatorKey.currentState?.pop();
  }
}
