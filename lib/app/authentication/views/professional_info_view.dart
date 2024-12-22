import 'package:flaury_business/util/app_spacing.dart';
import 'package:flaury_business/util/app_text_style.dart';
import 'package:flaury_business/widgets/app_buttons.dart';
import 'package:flaury_business/widgets/app_textfields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfessionalInfoView extends ConsumerStatefulWidget {
  const ProfessionalInfoView({super.key, required this.ontap});
  final VoidCallback? ontap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfessionalInfoViewState();
}

class _ProfessionalInfoViewState extends ConsumerState<ProfessionalInfoView> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController descriptionNameController =
      TextEditingController();

  @override
  void dispose() {
    businessNameController.dispose();
    descriptionNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AppSpacing(v: 20),
          AppTextSemiBold(
              text:
                  'This information will help customers find you on the Flaury app',
              fontSize: 12),
          const AppSpacing(v: 20),
          const CustomDropDown(
            hint: 'select category',
          ),
          const AppSpacing(v: 20),

          // Business name
          CustomTextfield(
            label: 'Business name',
            hintext: 'Enter your business name',
            obscureText: false,
            controller: businessNameController,
          ),
          const AppSpacing(v: 20),

          // description
          MultiLineTextfield(
            label: 'Description',
            hintext:
                'Share a bit about your skills, work experience, and about your expertise.',
            controller: descriptionNameController,
          ),
          const AppSpacing(v: 40),

          ListenableBuilder(
              listenable: Listenable.merge(
                  [businessNameController, descriptionNameController]),
              builder: (_, child) {
                var enable = businessNameController.text.isNotEmpty &&
                    descriptionNameController.text.isNotEmpty;
                return enable
                    ? LargeButon(label: 'Continue', ontap: widget.ontap)
                    : const LargeButonDisabled(label: 'Continue', ontap: null);
              })
        ],
      ),
    );
  }
}
