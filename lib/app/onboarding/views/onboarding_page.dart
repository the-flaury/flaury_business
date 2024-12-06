import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {super.key,
      required this.image,
      this.subtitle = '',
      required this.title,
      this.islastImage = false});
  final String title;
  final String image;
  final bool islastImage;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 150),
              ),
              Container(
                alignment: Alignment.center,
                child: SvgAssets(
                  svg: image,
                  height: islastImage
                      ? SizeConfig.fromDesignHeight(context, 320)
                      : SizeConfig.fromDesignHeight(context, 380),
                  width: islastImage
                      ? SizeConfig.fromDesignWidth(context, 320)
                      : SizeConfig.fromDesignHeight(context, 400),
                ),
              ),
            ],
          ),
        ),
        Flexible(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.fromDesignWidth(context, 27)),
                child: Column(
                  children: [
                    AppTextBold(
                      text: title,
                      fontSize: 20,
                      textAlign: TextAlign.center,
                    ),
                    AppTextSemiBold(
                      text: subtitle,
                      fontSize: 16,
                      color: AppColors.grey100,
                      textAlign: TextAlign.center,
                    )
                  ],
                ))),
      ],
    );
  }
}
