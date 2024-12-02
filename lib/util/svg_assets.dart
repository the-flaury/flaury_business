import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAssets extends StatelessWidget {
  final double? width, height;
  final String svg;
  final ColorFilter? colorFilter;

  const SvgAssets(
      {super.key,
      required this.svg,
      this.height,
      this.width,
      this.colorFilter});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      width: width,
      height: height,
      colorFilter: colorFilter,
    );
  }
}

// Svg  icons
class SvgAssetsicons extends StatelessWidget {
  final double? width, height;
  final String svg;
  final Function()? ontap;
  const SvgAssetsicons(
      {super.key, required this.svg, this.height, this.width, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SvgPicture.asset(
        svg,
        width: width,
        height: height,
      ),
    );
  }
}
