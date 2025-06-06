import 'package:flaury_business/services/digalogue_service.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddVerificationDetailsView extends ConsumerStatefulWidget {
  const AddVerificationDetailsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddVerificationDetailsViewState();
}

class _AddVerificationDetailsViewState
    extends ConsumerState<AddVerificationDetailsView> {
  String? _selsctedValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSpacing(v: 20),
          AppTextSemiBold(
              text:
                  'For the safety of our customers, you are required to submit either of these documents for verification.',
              fontSize: 12),
          const AppSpacing(v: 20),
          AppTextBold(text: 'Verification type', fontSize: 16),
          const AppSpacing(v: 14),

          CustomDropDown(
            hint: 'select category',
            items: acceptableIdForVerification.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selsctedValue = value; // Correctly update the selected value
              });
            },
          ),

          const AppSpacing(v: 20),

          // upload banner img
          AppTextBold(text: 'Upload banner image', fontSize: 16),
          const AppSpacing(v: 13),
          InkWell(
            onTap: () {
              // open device camera picker
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.grey30,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.fromDesignHeight(context, 55),
                  horizontal: SizeConfig.fromDesignWidth(context, 86)),
              child: Column(
                children: [
                  const SvgAssets(svg: camera),
                  AppTextSemiBold(
                    text: 'Upload Verification photo',
                    fontSize: 14,
                    color: AppColors.grey,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const AppSpacing(v: 150),

          // submit button
          LargeButon(
              label: 'Continue',
              ontap: () {
                debugPrint(_selsctedValue);
                DialogService.onSuccessAlertDialouge(
                    title: 'Successful!',
                    message: 'You have successfully created your account.',
                    svgAsset: newPasswordPop);
              }),
          const AppSpacing(v: 20),

          // Skip button
          LargeButon(
            label: 'Skip',
            ontap: () {},
            isWhitebutton: true,
          ),

          const AppSpacing(v: 20),
        ],
      ),
    );
  }
}

List<String> acceptableIdForVerification = [
  'national id',
  'International Passport',
  'Drivers license'
];
