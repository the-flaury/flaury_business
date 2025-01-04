import 'package:flaury_business/routes/navigator_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});

class NavigationService {
  final context = NavigatorHelper().navigatorKey;

  Future<dynamic> pushTo({
    String? route,
    Widget? page,
    dynamic arguments,
  }) {
    if (route != null) {
      return context.currentState!.pushNamed(route, arguments: arguments);
    } else if (page != null) {
      return context.currentState!.push(
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      throw ArgumentError('Either route or page must be provided.');
    }
  }

  Future<dynamic> pushReplacement({
    String? route,
    Widget? page,
    dynamic arguments,
  }) {
    if (route != null) {
      return context.currentState!
          .pushReplacementNamed(route, arguments: arguments);
    } else if (page != null) {
      return context.currentState!.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      throw ArgumentError('Either route or page must be provided.');
    }
  }

  dynamic pop() {
    context.currentState?.pop();
  }
}
