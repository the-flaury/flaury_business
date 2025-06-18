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
  final TextEditingController _phonenumbercontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _fullnamecontroller = TextEditingController();
  String? _selsctedValue;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _phonenumbercontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _fullnamecontroller.dispose();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    //  fullname field
                    AuthTextfield(
                      hintext: 'Becca Braunch',
                      obscureText: false,
                      validator: Validator.nameValidator,
                      controller: _fullnamecontroller,
                      label: 'Name',
                    ),

                    SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
                    //  usernqame field
                    AuthTextfield(
                      hintext: 'BeccaBraunchy ',
                      obscureText: false,
                      validator: Validator.nameValidator,
                      controller: _usernamecontroller,
                      label: 'Username',
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
                    const AppSpacing(v: 20),

                    //phonenumber field
                    AuthTextfield(
                      hintext: '+234 9153528174',
                      obscureText: false,
                      controller: _phonenumbercontroller,
                      label: 'Phone Number',
                      keyboardType: TextInputType.phone,
                    ),
                    const AppSpacing(v: 20),
                    AppTextBold(text: 'Gender', fontSize: 14),
                    const AppSpacing(v: 5),

                    CustomDropDown(
                      hint: 'select category',
                      items: acceptableGender.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selsctedValue =
                              value; // Correctly update the selected value
                        });
                      },
                    ),
                    const AppSpacing(v: 20),

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
                          _phonenumbercontroller,
                          _usernamecontroller,
                          _passwordcontroller,
                          _fullnamecontroller,
                        ]),
                        builder: (context, child) {
                          final enable = _emailcontroller.text.isNotEmpty &&
                              _phonenumbercontroller.text.isNotEmpty &&
                              _passwordcontroller.text.isNotEmpty &&
                              _usernamecontroller.text.isNotEmpty &&
                              _fullnamecontroller.text.isNotEmpty;

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
                                            email: _emailcontroller.text,
                                            password: _passwordcontroller.text,
                                            userName: _usernamecontroller.text,
                                            gender: _selsctedValue ?? "",
                                            name:
                                                _fullnamecontroller.text.trim(),
                                            phoneNumber: _phonenumbercontroller
                                                .text
                                                .trim())
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

final List<String> acceptableGender = ['male', 'female'];
