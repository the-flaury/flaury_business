import 'package:flaury_business/app/bookings/notifiers/booking_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remindMeToggleProvider =
    StateNotifierProvider<RemindMeToggleNotifier, RemindMeToggleState>(
  (ref) => RemindMeToggleNotifier(),
);
