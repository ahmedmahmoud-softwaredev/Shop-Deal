import 'package:flutter/material.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        controller: controller,
        keyboardType: TextInputType.number,
        length: 6,
        validator: (value) {
          if (value!.isEmpty) {
            return "Pin Code fields can't be empty!";
          }
          return null;
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldWidth: 40.0,
          fieldHeight: 40.0,
          activeColor: AppColors.primaryColor,
          selectedColor: AppColors.borderGreyColor,
          inactiveColor: AppColors.borderGreyColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              4.0,
            ),
          ),
        ),
      ),
    );
  }
}
