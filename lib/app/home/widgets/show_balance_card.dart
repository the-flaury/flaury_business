import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/date_time_config.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShowBalanceCard extends ConsumerStatefulWidget {
  final String accountbalance;
  final Function()? onTap;
  const ShowBalanceCard({super.key, required this.accountbalance, this.onTap});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShowBalanceCardState();
}

class _ShowBalanceCardState extends ConsumerState<ShowBalanceCard> {
  bool isTotalBalanceVisible = false;

  @override
  Widget build(BuildContext context) {
    // parse the string account balance to int
    var mainaccBalance = int.parse(widget.accountbalance);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(35),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
          color: AppColors.background),
      padding: EdgeInsets.only(
          left: SizeConfig.fromDesignWidth(context, 15),
          right: SizeConfig.fromDesignWidth(context, 15),
          top: SizeConfig.fromDesignHeight(context, 12),
          bottom: SizeConfig.fromDesignHeight(context, 25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // toatl balance text
                  AppTextRegular(text: 'Total balance', fontSize: 14),

                  IconButton(
                      onPressed: () {
                        setState(() {
                          isTotalBalanceVisible = !isTotalBalanceVisible;
                        });
                      },
                      icon: isTotalBalanceVisible
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility))
                ],
              ),

              // my wallet
              Row(
                children: [
                  // toatl balance text
                  AppTextRegular(text: 'My wallet', fontSize: 14),
                  const AppSpacing(h: 10),
                  InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      padding: EdgeInsets.all(
                          SizeConfig.fromDesignHeight(context, 10)),
                      decoration: const BoxDecoration(
                        color: AppColors.green,
                        shape: BoxShape.circle,
                      ),
                      child: SvgAssets(
                        svg: rightArrow,
                        height: SizeConfig.fromDesignHeight(context, 16),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          // total balance amount
          isTotalBalanceVisible
              ? AppTextBold(
                  text: symbolNairaFormatted.format(mainaccBalance),
                  fontSize: 24)
              : AppTextBold(text: '******', fontSize: 24)
        ],
      ),
    );
  }
}
