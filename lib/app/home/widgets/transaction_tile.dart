import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/date_time_config.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SvgAssets(svg: arrowUpGreen),
                  AppTextSemiBold(text: 'Transfer to wallet', fontSize: 12)
                ],
              ),
              AppTextBold(
                  text: symbolNairaFormatted.format(30000), fontSize: 12)
            ],
          ),
          const AppSpacing(v: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextSemiBold(
                  text: 'Pella Sophia | ${formatCurrentDate(DateTime.now())}',
                  fontSize: 12),
              AppTextBold(
                text: 'Succesful',
                fontSize: 12,
                color: AppColors.transGreen,
              )
            ],
          ),
          const Divider(color: AppColors.grey)
        ],
      ),
    );
  }
}
