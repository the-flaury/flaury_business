import 'package:flaury_business/app/bookings/views/bookings_view.dart';
import 'package:flaury_business/app/dashboard/providers/bottom_nav_state_provider.dart';
import 'package:flaury_business/app/home/views/home_view.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navstate = ref.watch(bottomNavProvider);
    final index = navstate.currentindex;
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return GoogleFonts.montserrat(
                    color: AppColors.primary,
                    fontSize: SizeConfig.fontSize(context, 12),
                    fontWeight: FontWeight.w400,
                  );
                }
                return GoogleFonts.montserrat(
                  color: AppColors.black,
                  fontSize: SizeConfig.fontSize(context, 12),
                  fontWeight: FontWeight.w400,
                );
              },
            ),
            indicatorColor: Colors.transparent),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            ref.read(bottomNavProvider.notifier).updatePage(index);
          },
          selectedIndex: index,
          backgroundColor: AppColors.background,
          destinations: const [
            NavigationDestination(
              icon: SvgAssets(svg: home),
              label: 'Home',
              selectedIcon: SvgAssets(
                svg: home,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
              icon: SvgAssets(svg: bookings),
              label: 'Bookings',
              selectedIcon: SvgAssets(
                svg: bookings,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
              icon: SvgAssets(svg: chaticon),
              label: 'Chat',
              selectedIcon: SvgAssets(
                svg: chaticon,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
              icon: SvgAssets(svg: profile),
              label: 'profile',
              selectedIcon: SvgAssets(
                svg: profile,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Widget> _pages = [
  const Homeview(),
  const BookingsView(),
  Center(child: AppTextBold(text: 'chat', fontSize: 12)),
  Center(child: AppTextBold(text: 'profile', fontSize: 12))
];
