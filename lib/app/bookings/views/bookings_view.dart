import 'package:flaury_business/app/bookings/widgets/booking_card.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<Widget> tabs = [
  const UpcomingBookings(),
  const CompletedBookings(),
  const CancelledBookings()
];

class BookingsView extends ConsumerStatefulWidget {
  const BookingsView({super.key});

  @override
  ConsumerState<BookingsView> createState() => _BookingsPageState();
}

class _BookingsPageState extends ConsumerState<BookingsView> {
  int selectedIndex = 0;
  void _selectTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SymmetricPadding(
            h: 20,
            v: 0,
            child: Column(
              children: [
                const AppSpacing(v: 20),

                // status row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //upcoming
                    InkWell(
                        onTap: () => _selectTab(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            selectedIndex == 0
                                ? AppTextBold(text: status[0], fontSize: 16)
                                : AppTextRegular(text: status[0], fontSize: 16),
                            const AppSpacing(v: 8),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 3,
                              width: selectedIndex == 0
                                  ? SizeConfig.fromDesignWidth(context, 78)
                                  : 0,
                              color: selectedIndex == 0
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ),
                          ],
                        )),

                    // completed
                    InkWell(
                        onTap: () => _selectTab(1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            selectedIndex == 1
                                ? AppTextBold(text: status[1], fontSize: 16)
                                : AppTextRegular(text: status[1], fontSize: 16),
                            const AppSpacing(v: 8),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 3,
                              width: selectedIndex == 1
                                  ? SizeConfig.fromDesignWidth(context, 88)
                                  : 0,
                              color: selectedIndex == 1
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ),
                          ],
                        )),

                    InkWell(
                        onTap: () => _selectTab(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            selectedIndex == 2
                                ? AppTextBold(text: status[2], fontSize: 16)
                                : AppTextRegular(text: status[2], fontSize: 16),
                            const AppSpacing(v: 8),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 3,
                              width: selectedIndex == 2
                                  ? SizeConfig.fromDesignWidth(context, 88)
                                  : 0,
                              color: selectedIndex == 2
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ),
                          ],
                        )),
                  ],
                ),

                const AppSpacing(v: 32),

                // status body
                Expanded(child: tabs[selectedIndex])
              ],
            ),
          ),
        ));
  }
}

enum BookingStatus {
  upcoming('Upcoming'),
  completed('Completed'),
  cancelled('Cancelled');

  final String status;
  const BookingStatus(this.status);
}

List<String> status = [
  BookingStatus.upcoming.status,
  BookingStatus.completed.status,
  BookingStatus.cancelled.status,
];

class UpcomingBookings extends ConsumerStatefulWidget {
  const UpcomingBookings({super.key});

  @override
  ConsumerState<UpcomingBookings> createState() => _UpcomingBookingsState();
}

class _UpcomingBookingsState extends ConsumerState<UpcomingBookings> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView.builder(
        itemCount: 5, // Example number of completed bookings
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: SizeConfig.fromDesignHeight(context, 10)),
            child: BookingCard(
              index: index, // Pass the index to each BookingCard
            ),
          );
        });
  }
}

class CompletedBookings extends ConsumerWidget {
  const CompletedBookings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: 5, // Example number of completed bookings
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: SizeConfig.fromDesignHeight(context, 10)),
            child: BookingCard(
              index: index, // Pass the index to each BookingCard
              isBookingCompleted: true,
            ),
          );
        });
  }
}

class CancelledBookings extends ConsumerWidget {
  const CancelledBookings({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: 5, // Example number of completed bookings
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: SizeConfig.fromDesignHeight(context, 10)),
            child: BookingCard(
              index: index,
              isCancelled: true,
            ),
          );
        });
  }
}
