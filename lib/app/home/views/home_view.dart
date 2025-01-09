import 'package:flaury_business/app/home/widgets/show_balance_card.dart';
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
              // account balance card
              ShowBalanceCard(
                accountbalance: "300000",
                onTap: () {
                  // navigate to the my wallet screen
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
