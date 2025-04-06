import 'package:flaury_business/app/bookings/controller/booking_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remindMeToggleProvider =
    StateNotifierProvider<RemindMeToggleNotifier, RemindMeToggleState>(
  (ref) => RemindMeToggleNotifier(),
);
