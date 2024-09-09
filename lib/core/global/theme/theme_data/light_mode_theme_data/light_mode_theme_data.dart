import 'package:flutter/material.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/app_constants.dart';
import 'package:shop_deal/core/utils/text_styles.dart';

ThemeData lightModeThemeData() => ThemeData(
    fontFamily: AppConstants.sfProFontFamily,
    primaryColor: AppColors.primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll(
          AppColors.primaryColor,
        ),
        textStyle: WidgetStatePropertyAll(
          Styles.textStyles18.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            4.0,
          ),
        ),
      ),
    ));
