import 'package:flaury_business/app/profile/widgets/settings_tile.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangeProfileDetailsView extends ConsumerWidget {
  const ChangeProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationServiceProvider);
    return SafeArea(
      child: Scaffold(
          body: SymmetricPadding(
        h: 20,
        v: 0,
        child: Column(
          children: [
            // appbar
            const AppSpacing(v: 20),
            Row(
              children: [
                SvgAssetsicons(
                  svg: back,
                  height: SizeConfig.fromDesignHeight(context, 20),
                  ontap: () => Navigator.pop(context),
                ),
                const AppSpacing(h: 6),
                AppTextBold(text: 'Profile', fontSize: 18),
                const AppSpacing(v: 20),
              ],
            ),
            //edit profile
            ChangeProfileSettingTile(
              label: 'Edit Profile',
              ontap: () {
                navigation.pushTo(route: AppRoutes.editprofile);
              },
            ),

            //change password
            ChangeProfileSettingTile(
              label: 'Change password',
              ontap: () {},
            ),
          ],
        ),
      )),
    );
  }
}
