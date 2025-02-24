import 'package:cached_network_image/cached_network_image.dart';
import 'package:flaury_business/app/profile/widgets/log_out_button.dart';
import 'package:flaury_business/app/profile/widgets/settings_tile.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/services/digalogue_service.dart';
import 'package:flaury_business/services/navigation_service.dart'
    show NavigationService;
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alert = ref.watch(dialogServiceProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //place holder image is hardcoded for now
              CachedNetworkImage(
                imageUrl:
                    "https://taupesalon.com/wp-content/uploads/2024/07/6.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  height: SizeConfig.fromDesignHeight(context, 240),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),

              SymmetricPadding(
                v: 0,
                h: 20,
                child: Column(
                  children: [
                    //settings icons
                    SettingsTile(
                      ontap: () => Navigator.pushNamed(
                          context, AppRoutes.changeProfiledetails),
                      label: 'Profile',
                      svgAssets: profileOutline,
                    ),

                    //payments
                    SettingsTileV2(
                      ontap: () {
                        // Navigator.pushNamed(context, AppRoutes.aboutPageView);
                      },
                      label: 'Payments',
                      svgAssets: wallet,
                      label2: 'Wallet, transactions, & payouts',
                    ),
                    // services
                    SettingsTileV2(
                      ontap: () {
                        // Navigator.pushNamed(context, "/");
                      },
                      label: 'Services',
                      svgAssets: cupon,
                      label2: 'Create and manage your services',
                    ),

                    // about
                    SettingsTileV2(
                      ontap: () {
                        Navigator.pushNamed(context, AppRoutes.aboutPageView);
                      },
                      label: 'About',
                      svgAssets: info,
                      label2: ' FAQ, Privacy Policy, Terms & Conditions',
                    ),

                    // promotions
                    SettingsTileV2(
                      ontap: () {},
                      label: 'Promotions',
                      svgAssets: promotions,
                      label2:
                          'Create and manage coupon codes for your customers.',
                    ),

                    // blog
                    SettingsTileV2(
                      ontap: () {
                        Navigator.pushNamed(context, AppRoutes.aboutPageView);
                      },
                      label: 'blog',
                      svgAssets: blog,
                      label2:
                          'Read articles, stories on how to manage your beauty lifestyle',
                    ),
                    const AppSpacing(v: 20),

                    LogOutButton(ontap: () {
                      alert.logouttDialouge(
                          title: "Log Out?",
                          ontap: () {
                            // implement sign out logic here
                          },
                          popontap: () {
                            NavigationService().pop();
                          });
                    }),
                    const AppSpacing(v: 38),

                    const AppSpacing(v: 10),
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
