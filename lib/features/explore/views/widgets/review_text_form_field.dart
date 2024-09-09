import 'package:flutter/material.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/generated/l10n.dart';

class ReviewTextFormField extends StatelessWidget {
  const ReviewTextFormField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: S.of(context).tellUsYourExperience,
        hintStyle: Styles.textStyles18.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderGreyColor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderGreyColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
