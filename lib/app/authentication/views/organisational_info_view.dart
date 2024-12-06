import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_radio_text_value.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrganisationalInfoView extends ConsumerStatefulWidget {
  const OrganisationalInfoView({super.key, required this.ontap});
  final VoidCallback? ontap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrganisationalInfoViewState();
}

class _OrganisationalInfoViewState
    extends ConsumerState<OrganisationalInfoView> {
  String? _selectedOption = '';
  bool value = false;
  final TextEditingController locationController = TextEditingController();

  void toggleCheckbox() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // radio selected bools
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSpacing(v: 20),
          // what is your team size
          AppTextBold(text: 'What’s your team size?', fontSize: 16),
          const AppSpacing(v: 10),

          AppTextSemiBold(
            text:
                'This information will help us set up your calendar correctly.',
            fontSize: 12,
            color: AppColors.black,
          ),
          const AppSpacing(v: 21),

          // option 1
          CustomRadioAndTextValue(
            groupvalue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
                debugPrint('$value');
              });
            },
            label: 'just me',
            value: '1',
          ),
          // option 2
          const AppSpacing(v: 16),

          CustomRadioAndTextValue(
            groupvalue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
                debugPrint('$value');
              });
            },
            label: '2-5 people',
            value: '<5',
          ),
          // option 3
          const AppSpacing(v: 16),

          CustomRadioAndTextValue(
            groupvalue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
                debugPrint('$value');
              });
            },
            label: '6-10 people',
            value: '<10',
          ),
          // option 4
          const AppSpacing(v: 16),

          CustomRadioAndTextValue(
            groupvalue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
                debugPrint('$value');
              });
            },
            label: '11+ people',
            value: '<11',
          ),
          const AppSpacing(v: 20),

          // set location

          AppTextBold(text: 'Set your location', fontSize: 16),

          AppTextRegular(
            text:
                'Add your business location so your clients can easily find you.',
            fontSize: 12,
            overflow: TextOverflow.clip,
          ),
          const AppSpacing(v: 30),

          // where is your business located
          AppTextBold(text: 'Where’s your business located?', fontSize: 14),
          const AppSpacing(v: 10),

          MainCustomTextfield(
            hintext: 'Enter Manually',
            obscureText: false,
            prefixIcon: const Icon(
              size: 18,
              Icons.location_pin,
              color: AppColors.primary,
            ),
            controller: locationController,
          ),
          const AppSpacing(v: 10),

          // i dont have a business adddress
          //checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 24),
                width: SizeConfig.fromDesignWidth(context, 24),
                child: Checkbox(
                  checkColor: AppColors.white,
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.primary;
                    }
                    return Colors.transparent;
                  }),
                  value: value,
                  onChanged: (value) {
                    toggleCheckbox();

                    if (value == true) {
                      debugPrint(
                          'you have indicated that you do not currently have a business address');
                    }
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const AppSpacing(h: 10),
              AppTextBold(
                  overflow: TextOverflow.fade,
                  text:
                      'I don’t have a business address (mobile and online \nservices only)',
                  fontSize: 10)
            ],
          ),
          const AppSpacing(v: 18),

          // upload profile img
          AppTextBold(text: 'Upload profile image', fontSize: 16),
          const AppSpacing(v: 13),

          InkWell(
            onTap: () {
              // open device camera picker
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.grey, shape: BoxShape.circle),
              padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 50)),
              child: const SvgAssets(svg: camera),
            ),
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
                  horizontal: SizeConfig.fromDesignWidth(context, 95)),
              child: Column(
                children: [
                  const SvgAssets(svg: camera),
                  AppTextSemiBold(
                    text: 'Upload profile photo',
                    fontSize: 14,
                    color: AppColors.grey,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const AppSpacing(v: 30),

          // continue button
          LargeButon(label: 'Continue', ontap: widget.ontap),

          const AppSpacing(v: 48),
        ],
      ),
    );
  }
}
