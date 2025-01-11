import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flutter/material.dart';

class BookingStaticsWidget extends StatelessWidget {
  final String appointmentValue,
      succesfulBookingsvalue,
      cancelledBookingsValue,
      pendingBookingsValue;
  const BookingStaticsWidget({
    super.key,
    required this.appointmentValue,
    required this.cancelledBookingsValue,
    required this.pendingBookingsValue,
    required this.succesfulBookingsvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey)),
      padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextBold(text: "Booking Statistics", fontSize: 16),
          const AppSpacing(v: 4),
          AppTextRegular(text: "last 30 days", fontSize: 10),
          const AppSpacing(v: 12),
          Center(
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AppTextRegular(
                        text: 'Appointments',
                        fontSize: 10,
                        color: AppColors.grey,
                      ),
                      const AppSpacing(v: 12),
                      AppTextBold(text: appointmentValue, fontSize: 16),
                    ],
                  ),
                  Column(
                    children: [
                      AppTextRegular(
                        text: 'Successful',
                        fontSize: 10,
                        color: AppColors.grey,
                      ),
                      const AppSpacing(v: 12),
                      AppTextBold(text: succesfulBookingsvalue, fontSize: 16),
                    ],
                  ),
                  Column(
                    children: [
                      AppTextRegular(
                        text: 'Cancelled',
                        fontSize: 10,
                        color: AppColors.grey,
                      ),
                      const AppSpacing(v: 12),
                      AppTextBold(text: cancelledBookingsValue, fontSize: 16),
                    ],
                  ),
                  Column(
                    children: [
                      AppTextRegular(
                        text: 'Pending',
                        fontSize: 10,
                        color: AppColors.grey,
                      ),
                      const AppSpacing(v: 12),
                      AppTextBold(text: pendingBookingsValue, fontSize: 16),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
