import 'package:flaury_business/app/authentication/views/add_verification_details_view.dart';
import 'package:flaury_business/app/authentication/views/organisational_info_view.dart';
import 'package:flaury_business/app/authentication/views/professional_info_view.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VerificationView extends ConsumerStatefulWidget {
  const VerificationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationViewState();
}

class _VerificationViewState extends ConsumerState<VerificationView> {
  List<bool> isPageCompleted = [true, false, false];
  late int selectedindex;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      selectedindex = index;
      for (int i = 0; i < isPageCompleted.length; i++) {
        isPageCompleted[i] = i <= selectedindex;
      }
    });
  }

  late List<Map<String, dynamic>> verificationPages;
  @override
  void initState() {
    selectedindex = 0;
    verificationPages = [
      {
        'title': 'Professional info',
        'view': ProfessionalInfoView(
          ontap: () {
            // logic goes here
            pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      },
      {
        'title': 'Organization info',
        'view': OrganisationalInfoView(
          ontap: () {
            // logic goes here
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      },
      {
        'title': 'Verification',
        'view': const AddVerificationDetailsView(),
      },
    ];
    super.initState();
  }
  // list of pages navigateable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SymmetricPadding(
        v: 0,
        h: 20,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSpacing(v: 20),
              // verification data title
              AppTextBold(
                  text: verificationPages[selectedindex]['title'],
                  fontSize: 20),

              const AppSpacing(v: 30),

              // page idicator
              Center(
                child: VerificationPageViewIndicator(
                  currentindex: selectedindex,
                  pageCompleted: isPageCompleted,
                ),
              ),

              Expanded(
                  child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: onPageChanged,
                controller: pageController,
                children: verificationPages
                    .map((page) => page['view'] as Widget)
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationPageViewIndicator extends StatelessWidget {
  const VerificationPageViewIndicator(
      {super.key, required this.currentindex, required this.pageCompleted});
  final int currentindex;
  final List<bool> pageCompleted;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 6)),
          child: SvgAssets(svg: pageCompleted[0] ? indicator : dot),
        ),
        Container(
          height: SizeConfig.fromDesignHeight(context, 2),
          width: SizeConfig.fromDesignWidth(context, 114),
          color: AppColors.grey100,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 6)),
          child: SvgAssets(svg: pageCompleted[1] ? indicator : dot),
        ),
        Container(
          height: SizeConfig.fromDesignHeight(context, 2),
          width: SizeConfig.fromDesignWidth(context, 114),
          color: AppColors.grey100,
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 6)),
          child: SvgAssets(svg: pageCompleted[2] ? indicator : dot),
        ),
      ],
    );
  }
}
