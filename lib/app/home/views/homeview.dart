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
              const AppSpacing(v: 10),
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
              // account balnce dashboard
              Container(
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
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.fromDesignWidth(context, 15),
                    vertical: SizeConfig.fromDesignHeight(context, 25)),
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
                                    isTotalBalanceVisible =
                                        !isTotalBalanceVisible;
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
                            Container(
                              padding: EdgeInsets.all(
                                  SizeConfig.fromDesignHeight(context, 10)),
                              decoration: const BoxDecoration(
                                color: AppColors.green,
                                shape: BoxShape.circle,
                              ),
                              child: SvgAssetsicons(
                                svg: rightArrow,
                                height:
                                    SizeConfig.fromDesignHeight(context, 16),
                                ontap: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    // total balance amount
                    isTotalBalanceVisible
                        ? AppTextBold(text: '100,000', fontSize: 24)
                        : AppTextBold(text: '******', fontSize: 24)
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
