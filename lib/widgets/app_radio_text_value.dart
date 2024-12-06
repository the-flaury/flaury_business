import 'package:flaury_business/util/app_colors.dart';
import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomRadioAndTextValue extends StatelessWidget {
  const CustomRadioAndTextValue(
      {super.key,
      required this.groupvalue,
      required this.onChanged,
      this.label = '',
      this.value = ''});
  final String? groupvalue;
  final Function(String?)? onChanged;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<String>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          activeColor: AppColors.primary,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: value,
          groupValue: groupvalue,
          onChanged: onChanged,
        ),
        const AppSpacing(
          h: 8,
        ),
        AppTextSemiBold(text: label, fontSize: 14)
      ],
    );
  }
}
