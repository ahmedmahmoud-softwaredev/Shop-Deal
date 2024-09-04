import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.text,
    this.formatter = const [],
    required this.onChanged,
    this.isEmail = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.isReadOnly = false,
  });
  final TextEditingController controller;
  final bool isEmail;
  final String text;
  final TextInputType keyboardType;
  final List<TextInputFormatter> formatter;
  final Function(String) onChanged;
  final int maxLines;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      inputFormatters: formatter,
      onChanged: onChanged,
      keyboardType: keyboardType,
      readOnly: isReadOnly,
      style: Styles.textStyles18.copyWith(
        fontWeight: FontWeight.w400,
      ),
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$text ${S.of(context).fieldCantBeEmpty}";
        } else {
          if (isEmail) {
            final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value);
            if (!emailValid) {
              return "please enter a valid email like example: XXXXXX@XXX.com";
            } else {
              return null;
            }
          } else {
            return null;
          }
        }
      },
    );
  }
}
