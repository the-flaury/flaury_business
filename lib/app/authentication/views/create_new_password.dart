import 'package:flaury_business/app/authentication/providers/password_visibility_provider.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/services/digalogue_service.dart';
import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/images_icons_illustration.dart';
import 'package:flaury_business/util/svg_assets.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePasswordView extends ConsumerStatefulWidget {
  const ChangePasswordView({super.key});

  @override
  ConsumerState<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  // this creates a timer to push user to the home page immediately after password is changed

  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obscurePassword = ref.watch(passwordsvisible);
    final obscurePasswords = ref.watch(confirmvisible);
    final navigation = ref.watch(navigationServiceProvider);

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
                const AppSpacing(
                  v: 20,
                ),

                //app bar
                Row(
                  children: [
                    SvgAssetsicons(
                      svg: back,
                      ontap: () {
                        navigation.pop();
                      },
                    ),
                    const AppSpacing(
                      h: 5,
                    ),
                    AppTextBold(
                      text: 'Create New Password',
                      fontSize: 18,
                      color: AppColors.black,
                    )
                  ],
                ),
                const AppSpacing(
                  v: 35,
                ),

                //image
                const Center(
                    child: SvgAssets(
                  svg: newpassword,
                  height: 240,
                )),

                const AppSpacing(
                  v: 40,
                ),

                AppTextBold(text: 'Create Your New Password', fontSize: 18),
                const AppSpacing(
                  v: 20,
                ),

                // password input texfield
                CustomTextfield(
                    label: 'New Password',
                    hintext: 'Enter New Password ',
                    obscureText: obscurePassword.isPasswordVisible,
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      color: AppColors.black,
                    ),
                    controller: newPasswordController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        obscurePassword.visiblePassword();
                      },
                      child: Icon(obscurePassword.isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )),

                const AppSpacing(
                  v: 16,
                ),
                CustomTextfield(
                  label: 'Confirm Password',
                  hintext: 'Confirm New Password',
                  obscureText: obscurePasswords.isPasswordVisible,
                  controller: confirmNewPasswordController,
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    color: AppColors.black,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      obscurePasswords.visiblePassword();
                    },
                    child: Icon(obscurePasswords.isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                const AppSpacing(
                  v: 105,
                ),

                //ap
                LargeButon(
                    label: 'Continue',
                    ontap: () async {
                      DialogService.onSuccessAlertDialouge(
                        title: 'Successful',
                        message: 'you have succesfully changed your password',
                        svgAsset: newPasswordPop,
                      );
                      //add email verification logic here

                      await Future.delayed(const Duration(seconds: 6));
                      navigation.pushReplacement(route: AppRoutes.signin);
                      //logic
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
