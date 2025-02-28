import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';

class BusinessDetailsView extends StatefulWidget {
  const BusinessDetailsView({super.key});

  @override
  State<BusinessDetailsView> createState() => _BusinessDetailsViewState();
}

class _BusinessDetailsViewState extends State<BusinessDetailsView> {
  @override
  Widget build(BuildContext context) {
    final businessNameController = TextEditingController();
    List<String> options = ['Open for selected hours', 'Always open'];
    String selectedOption = options[1];
    return SafeArea(
      child: Scaffold(
        body: SymmetricPadding(
          v: 0,
          h: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSpacing(v: 20),
              Row(
                children: [
                  SvgAssetsicons(
                    svg: back,
                    height: SizeConfig.fromDesignHeight(context, 20),
                    ontap: () => Navigator.pop(context),
                  ),
                  const AppSpacing(h: 6),
                  AppTextBold(text: ' Edit profile', fontSize: 18),
                  const AppSpacing(v: 20),
                ],
              ),
              const AppSpacing(v: 20),
              AppTextBold(text: "Business info", fontSize: 18),
              AppTextRegular(
                  text: 'Your business name is displayed first on your profile',
                  fontSize: 12),

              // textfield
              CustomTextfield(
                hintext: 'Enter your business name ',
                controller: businessNameController,
                label: '',
                obscureText: false,
              ),
              const AppSpacing(v: 20),

              AppTextBold(text: "Upload banner image", fontSize: 16),
              const AppSpacing(v: 12),

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
                        text: 'Upload profile  photo',
                        fontSize: 14,
                        color: AppColors.grey,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const AppSpacing(v: 20),

              // time and calendar settings
              AppTextBold(text: "Time and calendar settings", fontSize: 18),
              AppTextRegular(
                  text:
                      'Set business hours to let your customers know when you are open.',
                  overflow: TextOverflow.clip,
                  fontSize: 12),
              const AppSpacing(v: 20),

              // set your business shedule
              AppTextBold(text: 'Schedule', fontSize: 18),

              AppTextRegular(
                  color: AppColors.grey,
                  text: 'Select your business schedule.',
                  overflow: TextOverflow.clip,
                  fontSize: 14),

              RadioListTile(
                title: Text('Option 1'),
                value: options[0],
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                    print("Selected option: $selectedOption"); //Added print
                  });
                },
              ),
              RadioListTile(
                title: Text('Option 2'),
                value: options[1],
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                    print("Selected option: $selectedOption"); //Added print
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
