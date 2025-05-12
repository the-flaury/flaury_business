import 'package:flaury_business/app/authentication/controllers/auth_controller.dart';
import 'package:flaury_business/app/authentication/providers/password_visibility_provider.dart';
import 'package:flaury_business/routes/app_routes.dart';
import 'package:flaury_business/services/navigation_service.dart';
import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/util/custom_padding.dart';
import 'package:flaury_business/util/size_config.dart';
import 'package:flaury_business/util/validator.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _lastnamecontroller.dispose();
    _passwordcontroller.dispose();
    _firstnamecontroller.dispose();
    _usernamecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obscurePassword = ref.watch(passwordvisible);
    final navigation = ref.watch(navigationServiceProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formkey,
              child: SymmetricPadding(
                h: 20,
                v: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 20),
                    ),
                    // appbar
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.fromDesignHeight(context, 4),
                        ),
                        AppTextBold(text: 'Create your account', fontSize: 18)
                      ],
                    ),

                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 20),
                    ),

                    AuthTextfield(
                      hintext: 'Becca Braunch',
                      obscureText: false,
                      validator: Validator.nameValidator,
                      controller: _usernamecontroller,
                      label: 'Username',
                    ),
                    const AppSpacing(v: 20),
                    //name textfield
                    AuthTextfield(
                      hintext: 'Becca Braunch',
                      obscureText: false,
                      validator: Validator.nameValidator,
                      controller: _firstnamecontroller,
                      label: 'First Name',
                    ),

                    const AppSpacing(v: 20),
                    //name textfield
                    AuthTextfield(
                      hintext: 'Becca Braunch',
                      obscureText: false,
                      validator: Validator.nameValidator,
                      controller: _lastnamecontroller,
                      label: 'Last Name',
                    ),

                    SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),

                    //email textfield
                    AuthTextfield(
                      hintext: 'info@flaury.email.com',
                      obscureText: false,
                      validator: Validator.emailValidator,
                      controller: _emailcontroller,
                      label: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 20),
                    ),

                    //password field

                    AuthTextfield(
                        hintext: 'Enter Your Password',
                        obscureText: obscurePassword.isPasswordVisible,
                        validator: Validator.passwordValidator,
                        controller: _passwordcontroller,
                        label: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obscurePassword.visiblePassword();
                          },
                          child: Icon(obscurePassword.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),

                    SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
                    //terms and condition text
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text:
                                'Clicking the “Sign up” button means I agree to the',
                            style: GoogleFonts.montserrat(
                              color: AppColors.primary,
                              fontSize: SizeConfig.fontSize(context, 10),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' Terms & Conditions and Privacy Policy of FLAURY',
                            style: GoogleFonts.montserrat(
                              color: AppColors.primary,
                              fontSize: SizeConfig.fontSize(context, 10),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ])),

                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 29),
                    ),

                    //sign up button
                    ListenableBuilder(
                        listenable: Listenable.merge([
                          _emailcontroller,
                          _lastnamecontroller,
                          _firstnamecontroller,
                          _passwordcontroller,
                          _usernamecontroller,
                        ]),
                        builder: (context, child) {
                          final enable = _emailcontroller.text.isNotEmpty &&
                              _lastnamecontroller.text.isNotEmpty &&
                              _passwordcontroller.text.isNotEmpty &&
                              _firstnamecontroller.text.isNotEmpty &&
                              _usernamecontroller.text.isNotEmpty;

                          return enable
                              ? LargeButon(
                                  isloading: ref
                                          .watch(authControllerProvider)
                                          .status ==
                                      AuthStatus.loading,
                                  label: "Sign up",
                                  ontap: () {
                                    ref
                                        .read(authControllerProvider.notifier)
                                        .signUp(
                                          _emailcontroller.text,
                                          _passwordcontroller.text,
                                          _firstnamecontroller.text,
                                          _lastnamecontroller.text,
                                          _usernamecontroller.text,
                                        )
                                        .then((value) {
                                      navigation.pushTo(
                                          route: AppRoutes.verification);
                                    });
                                  },
                                )
                              : const LargeButonDisabled(
                                  label: 'Sign up', ontap: null);
                        }),

                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 27),
                    ),

                    //this routes to the sign in page

                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTextSemiBold(
                            text: "Already have an account?  ",
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                          GestureDetector(
                              onTap: () {
                                //logic goes here
                                Navigator.pushNamed(context, AppRoutes.signin);
                              },
                              child: AppTextBold(
                                  text: 'Log in',
                                  fontSize: 14,
                                  color: AppColors.primary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
