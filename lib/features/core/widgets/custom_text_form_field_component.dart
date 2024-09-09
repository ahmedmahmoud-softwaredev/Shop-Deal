import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/core/widgets/custom_text_form_field.dart';

class CustomTextFormFieldComponent extends StatelessWidget {
  const CustomTextFormFieldComponent({
    super.key,
    required this.controller,
    this.isEmail = false,
    required this.title,
    this.formatter = const [],
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.isReadOnly = false,
  });
  final String title;
  final TextEditingController controller;
  final bool isEmail;
  final TextInputType keyboardType;
  final List<TextInputFormatter> formatter;
  final Function(String) onChanged;
  final int maxLines;
  final bool isReadOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyles14.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        CustomTextFormField(
          controller: controller,
          isEmail: isEmail,
          text: title,
          formatter: formatter,
          onChanged: onChanged,
          maxLines: maxLines,
          keyboardType: keyboardType,
          isReadOnly: isReadOnly,
        ),
      ],
    );
  }
}
