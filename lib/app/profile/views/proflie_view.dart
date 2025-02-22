import 'package:flaury_business/app/profile/widgets/log_out_button.dart';
import 'package:flaury_business/app/profile/widgets/settings_tile.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: SafeArea(
            child: SymmetricPadding(
              v: 0,
              h: 20,
              child: Column(
                children: [
                  const AppSpacing(v: 70),
                  //place holder image
                  Center(
                    child: SvgAssets(
                      svg: profilePlaceholder,
                      height: SizeConfig.fromDesignHeight(context, 50),
                      width: SizeConfig.fromDesignWidth(context, 50),
                    ),
                  ),
                  const AppSpacing(v: 20),

                  //user's name
                  AppTextBold(text: 'Becca Adom', fontSize: 16),

                  //user's email
                  AppTextSemiBold(text: 'baeccagold@gmail.com', fontSize: 14),

                  const AppSpacing(v: 34),
                  //settings icons
                  SettingsTile(
                    ontap: () => Navigator.pushNamed(
                        context, AppRoutes.changeProfiledetails),
                    label: 'Profile',
                    svgAssets: profileOutline,
                  ),

                  //wallet
                  SettingsTile(
                    ontap: () {},
                    label: 'Wallet',
                    svgAssets: wallet,
                  ),
                  SettingsTileV2(
                    ontap: () {
                      Navigator.pushNamed(context, AppRoutes.aboutPageView);
                    },
                    label: 'About',
                    svgAssets: info,
                    label2: ' FAQ, Privacy Policy, Terms & Conditions',
                  ),
                  SettingsTileV2(
                    ontap: () {},
                    label: 'Promotions',
                    svgAssets: promotions,
                    label2:
                        'Get promo codes and enjoy discount on your bookings.',
                  ),

                  const AppSpacing(v: 101),

                  LogOutButton(
                    ontap: () {},
                  ),
                  const AppSpacing(v: 38),

                  Container(
                    padding: EdgeInsets.all(
                        SizeConfig.fromDesignHeight(context, 15)),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(34, 22, 12, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextBold(
                              text: 'Become a service provider',
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                            AppTextRegular(
                              text: 'Earn money while offering your skills',
                              fontSize: 10,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              SizeConfig.fromDesignHeight(context, 15)),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.white),
                          child: SvgAssets(
                            svg: rightArrow,
                            height: SizeConfig.fromDesignHeight(context, 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  const AppSpacing(v: 10),
                ],
              ),
            ),
          ),
        ));
  }
}
