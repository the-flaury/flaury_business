import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_pop_up_dialouges.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dialogServiceProvider = Provider<DialogService>((ref) {
  return DialogService();
});

class DialogService {
  static Future<void> onSuccessAlertDialouge({
    required String title,
    required String message,
    required String svgAsset,
  }) async {
    final context = NavigationService.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Navigator context is null.");
      return;
    }
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

  static Future<void> onErrorAlertDialouge({
    required String title,
    required String message,
    required String svgAsset,
  }) async {
    final context = NavigationService.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Navigator context is null.");
      return;
    }
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

  Future<void> logouttDialouge(
      {required String title,
      required VoidCallback? ontap,
      required VoidCallback? popontap}) async {
    final context = NavigationService.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Navigator context is null.");
      return;
    }
    await showDialog(
      context: context,
      builder: (_) {
        return CustomMediumAlertDialouge(
          children: [
            AppTextBold(
              text: title,
              fontSize: 16,
              textAlign: TextAlign.center,
            ),
            const AppSpacing(v: 20),
            ButtonCustom(
                label: "confirm", ontap: ontap, buttoncolor: AppColors.red),
            const AppSpacing(v: 20),
            ButtonCustom(
              label: "back",
              ontap: popontap,
              buttoncolor: AppColors.greylight,
              isgrey: true,
            )
          ],
        );
      },
    );
  }
}
