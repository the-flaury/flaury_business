import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EnterOtpView extends ConsumerStatefulWidget {
  const EnterOtpView({super.key, this.emailvalue});

  final String? emailvalue;

  @override
  ConsumerState<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends ConsumerState<EnterOtpView> {
  late TextEditingController pIn1controller;
  late TextEditingController pIn2controller;
  late TextEditingController pIn3controller;
  late TextEditingController pIn4controller;

  @override
  void initState() {
    super.initState();
    pIn1controller = TextEditingController();
    pIn2controller = TextEditingController();
    pIn3controller = TextEditingController();
    pIn4controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    pIn1controller.dispose();
    pIn2controller.dispose();
    pIn3controller.dispose();
    pIn4controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String getPinFromControllers(
        TextEditingController controller1,
        TextEditingController controller2,
        TextEditingController controller3,
        TextEditingController controller4) {
      // Concatenate text from each controller
      String pin = '';
      pin += controller1.text;
      pin += controller2.text;
      pin += controller3.text;
      pin += controller4.text;
      return pin;
    }

    return Scaffold(
      body: SafeArea(
        child: SymmetricPadding(
          h: 17,
          v: 0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 20),
                ), //app bar
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgAssetsicons(
                        svg: back,
                        ontap: () {
                          NavigationService().pop();
                        },
                      ),
                    ),
                    const AppSpacing(v: 5),
                    AppTextBold(text: 'Forgot Password', fontSize: 20),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                Center(
                    child: AppTextSemiBold(
                  text: "Code has been sent to ${widget.emailvalue}",
                  fontSize: 13,
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                //otp digit boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OtpTextfield(
                      controller: pIn1controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextfield(
                      controller: pIn2controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextfield(
                      controller: pIn3controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextfield(
                      controller: pIn4controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                //resend code
                Center(
                  child:
                      AppTextSemiBold(text: 'Resend code in 38s', fontSize: 14),
                ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 427),
                ),
                //verify button

                LargeButon(
                    label: 'verify',
                    ontap: () {
                      String pin = getPinFromControllers(pIn1controller,
                          pIn2controller, pIn3controller, pIn4controller);

                      debugPrint(pin);

                      //
                      Navigator.pushNamed(context, AppRoutes.enterNewPassword);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
