import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SymmetricPadding(
        v: 0,
        h: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SvgAssets(svg: errorIll),
            const AppSpacing(v: 20),
            AppTextBold(text: "Oops! You're Offline", fontSize: 16),
            const AppSpacing(v: 10),
            Center(
              child: AppTextRegular(
                text:
                    'Please check your internet and try again to continue exploring beauty and wellness services near you.',
                fontSize: 12,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
