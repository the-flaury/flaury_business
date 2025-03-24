import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HompageActionButton extends ConsumerWidget {
  final String icon, label, route;
  final Color color;

  const HompageActionButton({
    super.key,
    required this.color,
    required this.route,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationServiceProvider);
    return InkWell(
      onTap: () {
        navigation.pushTo(route: route);
      },
      child: Container(
        width: SizeConfig.fromDesignWidth(context, 105),
        padding: EdgeInsets.only(
          left: SizeConfig.fromDesignWidth(context, 10),
          right: SizeConfig.fromDesignWidth(context, 20),
          top: SizeConfig.fromDesignWidth(context, 10),
          bottom: SizeConfig.fromDesignWidth(context, 20),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 10)),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: SvgAssets(
                svg: icon,
                height: SizeConfig.fromDesignHeight(context, 15),
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
            const AppSpacing(v: 10),
            AppTextBold(text: label, fontSize: 10),
          ],
        ),
      ),
    );
  }
}
