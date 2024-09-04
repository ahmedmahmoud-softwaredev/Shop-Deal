import 'package:flutter/material.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/text_styles.dart';

ThemeData darkModeThemeData() => ThemeData.dark().copyWith(
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
      ),
    );