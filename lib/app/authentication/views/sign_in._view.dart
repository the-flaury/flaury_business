import 'package:flaury_business/app/authentication/providers/password_visibility_provider.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/validator.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInView extends StatefulHookConsumerWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  bool doYouWantToRemember = false;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void toggleCheckbox() {
    setState(() {
      doYouWantToRemember = !doYouWantToRemember;
    });
  }

  @override
  Widget build(BuildContext context) {
    final visible = ref.watch(passwordvisible);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SymmetricPadding(
            h: 24,
            v: 0,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 18),
                  ), //a
                  // header text

                  AppTextBold(
                    text: 'Hi, Welcome Back 👋',
                    fontSize: 20,
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 7),
                  ), //a

                  AppTextBold(
                      text: 'Connect with your glow with Flaury', fontSize: 12),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 24),
                  ), //a

                  //email field
                  AuthTextfield(
                    hintext: 'enter your email',
                    obscureText: false,
                    controller: _emailcontroller,
                    label: 'Email Address',
                    validator: Validator.emailValidator,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 14),
                  ), //a

                  //password field
                  AuthTextfield(
                    hintext: 'Enter your password',
                    obscureText: visible.isPasswordVisible,
                    controller: _passwordController,
                    label: 'Password',
                    validator: Validator.passwordValidator,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        visible.visiblePassword();
                      },
                      child: Icon(visible.isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 10),
                  ), //a
                  // remember me & forgot password

                  Row(
                    children: [
                      //checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              value: doYouWantToRemember,
                              onChanged: (value) {
                                toggleCheckbox();

                                if (value == true) {
                                  debugPrint(
                                      'you have indicated to remember sigin in info');
                                }
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                          const AppSpacing(h: 10),
                          AppTextBold(text: 'Remember Me', fontSize: 12)
                        ],
                      ),
                      const Spacer(),
                      //forgot password text
                      InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.changepassword),
                          child: AppTextBold(
                            text: 'Forgot Password?',
                            fontSize: 14,
                            color: AppColors.primary,
                          ))
                    ],
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 30),
                  ),

                  //sign in button
                  ListenableBuilder(
                    listenable: Listenable.merge(
                        [_passwordController, _emailcontroller]),
                    builder: (context, child) {
                      final enable = _emailcontroller.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty;
                      return enable
                          ? LargeButon(
                              label: 'Log in',
                              ontap: () {
                                //implement sign in logic here
                                // Navigator.pushNamed(
                                //     context, AppRoutes.);
                              })
                          : const LargeButonDisabled(
                              label: 'Log in', ontap: null);
                    },
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 20),
                  ),

                  //dont have an account create account
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextBold(
                          text: 'Don’t have an account?',
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          width: SizeConfig.fromDesignWidth(context, 6),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.signup);
                          },
                          child: AppTextBold(
                            text: 'Sign Up',
                            fontSize: 14,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
