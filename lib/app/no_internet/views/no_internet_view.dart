import 'package:flaury_business/util/app_text_style.dart';
import 'package:flutter/material.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTextBold(
          text: 'no internet connection, check your internet connection ',
          fontSize: 16,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
