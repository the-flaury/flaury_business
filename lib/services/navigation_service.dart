import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> pushTo({
    String? route,
    Widget? page,
    dynamic arguments,
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint('Error: Navigator context is null.');
      throw Exception('Navigator context is null. Cannot navigate.');
    }
    if (route != null) {
      return Navigator.of(context).pushNamed(route, arguments: arguments);
    } else if (page != null) {
      return Navigator.of(context).push(
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
    final context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint('Error: Navigator context is null.');
      throw Exception('Navigator context is null. Cannot navigate.');
    }
    if (route != null) {
      return Navigator.of(context)
          .pushReplacementNamed(route, arguments: arguments);
    } else if (page != null) {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      throw ArgumentError('Either route or page must be provided.');
    }
  }

  void pop() {
    final context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint('Error: Navigator context is null.');
      throw Exception('Navigator context is null. Cannot pop.');
    }
    Navigator.of(context).maybePop();
  }
}
