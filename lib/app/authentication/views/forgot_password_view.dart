import 'package:flaury_business/app/authentication/views/enter_otp_view.dart';
import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flaury_business/util/custom_padding.dart';

class ForgotPasswordView extends StatefulHookConsumerWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final TextEditingController emailController = TextEditingController(text: '');

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SymmetricPadding(
        h: 20,
        v: 0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 20),
              ),
              //app bar
              Row(
                children: [
                  SvgAssetsicons(
                    svg: back,
                    ontap: () {
                      NavigationService().pop();
                    },
                  ),
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 5),
                  ),
                  AppTextBold(text: 'Forgot Password', fontSize: 20)
                ],
              ),

              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 45),
              ),

              //image
              const Center(
                  child: SvgAssets(
                svg: forgotPassword,
                height: 200,
              )),

              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 70),
              ),

              AppTextSemiBold(
                  text: 'Enter your registered email address', fontSize: 14),

              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 30),
              ),
              RegularTextField(
                keyboardtype: TextInputType.emailAddress,
                controller: emailController,
                hintText: 'Email address',
              ),

              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 217),
              ),

              LargeButon(
                  label: 'Continue',
                  ontap: () {
                    //add email verification logic here
                    debugPrint(emailController.value.text);

                    // then navigate to otp screen

                    NavigationService().pushTo(
                        page: EnterOtpView(
                      emailvalue: emailController.text,
                    ));
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}

//
//

