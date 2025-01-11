import 'package:flaury_business/app/home/widgets/hompage_action_buttons.dart';
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
  List<Map<String, dynamic>> actonButtons = [
    {
      "icon": transactions,
      "label": "transactions",
      "sublabel": 'Check your transaction ',
      "color": AppColors.transGreen,
      "pageroute": AppRoutes.transactions
    },
    {
      "icon": cupon,
      "label": "Services",
      "sublabel": 'Add and update all your services',
      "color": AppColors.serviceBlue,
      "pageroute": AppRoutes.manageServices
    },
    {
      "icon": promotions,
      "label": "Promotions",
      "sublabel": 'Add and update your coupon codes ',
      "color": AppColors.prmotionsPurple,
      "pageroute": AppRoutes.managePromotons
    }
  ];

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
              const AppSpacing(v: 20),
              // account balance card
              ShowBalanceCard(
                accountbalance: "300000",
                onTap: () {
                  // navigate to the my wallet screen
                },
              ),

              const AppSpacing(v: 30),

              // cta buttons on home screen
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < actonButtons.length; i++) ...[
                    Expanded(
                      child: HompageActionButton(
                        color: actonButtons[i]['color'],
                        route: actonButtons[i]['pageroute'],
                        icon: actonButtons[i]['icon'],
                        label: actonButtons[i]['label'],
                      ),
                    ),
                    if (i < actonButtons.length - 1)
                      const AppSpacing(
                        h: 10,
                      ),
                  ],
                ],
              ),
              const AppSpacing(v: 20),

              // booking statistics

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey)),
                padding:
                    EdgeInsets.all(SizeConfig.fromDesignHeight(context, 10)),
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
                                AppTextBold(text: '720', fontSize: 16),
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
                                AppTextBold(text: '100', fontSize: 16),
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
                                AppTextBold(text: '10', fontSize: 16),
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
                                AppTextBold(text: '30', fontSize: 16),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
