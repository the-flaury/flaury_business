import 'package:flaury_business/app/dashboard/notifiers/bottom_nav_notifiers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavProvider =
    StateNotifierProvider.autoDispose<BottomNavNotifier, BottomNavState>(
  (ref) => BottomNavNotifier(),
);
