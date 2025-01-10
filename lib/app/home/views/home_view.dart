import 'package:flaury_business/app/home/widgets/show_balance_card.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Homeview extends ConsumerStatefulWidget {
  const Homeview({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeviewState();
}

class _HomeviewState extends ConsumerState<Homeview> {
  bool isTotalBalanceVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SymmetricPadding(
          h: 20,
          v: 0,
          child: Column(
            children: [
              const AppSpacing(v: 14),
              // app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SvgAssets(
                      svg: profilePlaceholder,
                      height: SizeConfig.fromDesignHeight(context, 50),
                    ),
                    const AppSpacing(h: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextSemiBold(text: 'Good morning ', fontSize: 14),
                        AppTextBold(text: 'Becca Baruch', fontSize: 16),
                      ],
                    ),
                  ]),
                  SvgAssetsicons(
                    svg: notification,
                    height: SizeConfig.fromDesignHeight(context, 24),
                  )
                ],
              ),
              const AppSpacing(v: 10),
              // account balance card
              ShowBalanceCard(
                accountbalance: "300000",
                onTap: () {
                  // navigate to the my wallet screen
                },
              ),

              const AppSpacing(v: 30),

              // transactions service promotions buttons
              Row(
                children: [
                  Container(
                    width: SizeConfig.fromDesignWidth(context, 105),
                    padding: EdgeInsets.only(
                      left: SizeConfig.fromDesignWidth(context, 10),
                      right: SizeConfig.fromDesignWidth(context, 20),
                      top: SizeConfig.fromDesignWidth(context, 10),
                      bottom: SizeConfig.fromDesignWidth(context, 20),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.transGreen)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              SizeConfig.fromDesignHeight(context, 10)),
                          decoration: const BoxDecoration(
                              color: AppColors.transGreen,
                              shape: BoxShape.circle),
                          child: SvgAssets(
                            svg: promotions,
                            height: SizeConfig.fromDesignHeight(context, 20),
                            colorFilter: const ColorFilter.mode(
                                AppColors.white, BlendMode.srcIn),
                          ),
                        ),
                        const AppSpacing(v: 10),
                        AppTextBold(text: "Services", fontSize: 10),
                        AppTextRegular(
                            text: "Add and update all your services.",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            fontSize: 6)
                      ],
                    ),
                  ),
                  const AppSpacing(h: 10),
                  Container(
                    width: SizeConfig.fromDesignWidth(context, 105),
                    padding: EdgeInsets.only(
                      left: SizeConfig.fromDesignWidth(context, 10),
                      right: SizeConfig.fromDesignWidth(context, 20),
                      top: SizeConfig.fromDesignWidth(context, 10),
                      bottom: SizeConfig.fromDesignWidth(context, 20),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.transGreen)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              SizeConfig.fromDesignHeight(context, 10)),
                          decoration: const BoxDecoration(
                              color: AppColors.transGreen,
                              shape: BoxShape.circle),
                          child: SvgAssets(
                            svg: promotions,
                            height: SizeConfig.fromDesignHeight(context, 20),
                            colorFilter: const ColorFilter.mode(
                                AppColors.white, BlendMode.srcIn),
                          ),
                        ),
                        const AppSpacing(v: 10),
                        AppTextBold(text: "Promotions", fontSize: 10),
                        AppTextRegular(
                            text: "Check your transaction ",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            fontSize: 6)
                      ],
                    ),
                  ),
                  const AppSpacing(h: 10),
                  Container(
                    width: SizeConfig.fromDesignWidth(context, 105),
                    padding: EdgeInsets.only(
                      left: SizeConfig.fromDesignWidth(context, 10),
                      right: SizeConfig.fromDesignWidth(context, 20),
                      top: SizeConfig.fromDesignWidth(context, 10),
                      bottom: SizeConfig.fromDesignWidth(context, 20),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.transGreen)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              SizeConfig.fromDesignHeight(context, 10)),
                          decoration: const BoxDecoration(
                              color: AppColors.transGreen,
                              shape: BoxShape.circle),
                          child: SvgAssets(
                            svg: promotions,
                            height: SizeConfig.fromDesignHeight(context, 20),
                            colorFilter: const ColorFilter.mode(
                                AppColors.white, BlendMode.srcIn),
                          ),
                        ),
                        const AppSpacing(v: 10),
                        AppTextBold(text: "Transactions", fontSize: 10),
                        AppTextRegular(
                            text: "Add and update your coupon codes ",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            fontSize: 6)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> actonButtons = [
  {
    "icon": transactions,
    "label": "transactions",
    "sublabel": 'Check your transaction ',
    "color": AppColors.transGreen,
    "pageroute": AppRoutes.changepassword
  },
  {
    "icon": cupon,
    "label": "transactions",
    "sublabel": 'Add and update all your services',
    "color": AppColors.transGreen,
  },
  {
    "icon": promotions,
    "label": "transactions",
    "sublabel": 'Add and update your coupon codes ',
    "color": AppColors.transGreen,
  }
];
