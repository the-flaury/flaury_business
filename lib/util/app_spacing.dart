import 'package:flaury_business/util/size_config.dart';
import 'package:flutter/material.dart';

class AppSpacing extends StatelessWidget {
  const AppSpacing({super.key, this.v = 0, this.h = 0});
  final int h;
  final int v;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.fromDesignWidth(context, h.toDouble()),
      height: SizeConfig.fromDesignHeight(context, v.toDouble()),
    );
  }
}
