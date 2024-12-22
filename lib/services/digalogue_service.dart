import 'package:flaury_business/routes/navigator_helper.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flaury_business/widgets/app_pop_up_dialouges.dart';
import 'package:flutter/material.dart';

class DialogService {
  static Future<void> onSuccessAlertDialouge({
    required String title,
    required String message,
    required String svgAsset,
  }) async {
    final context = NavigatorHelper.navigatorKey.currentContext!;
    await showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialouge(
          children: [
            const AppSpacing(v: 20),
            SvgAssets(svg: svgAsset),
            const AppSpacing(v: 20),
            AppTextBold(
              text: title,
              fontSize: 24,
              color: AppColors.primary,
              textAlign: TextAlign.center,
            ),
            const AppSpacing(v: 20),
            AppTextRegular(
              text: message,
              fontSize: 16,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ],
        );
      },
    );
  }
}
