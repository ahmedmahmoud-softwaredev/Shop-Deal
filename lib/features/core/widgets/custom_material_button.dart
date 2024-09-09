import 'package:flutter/material.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/core/view_model/app_cubit/app_cubit.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isWhite = false,
    this.isDisabled = false,
  });
  final String title;
  final VoidCallback onPressed;
  final bool isWhite;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isDisabled ? () {} : onPressed,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            4.0,
          ),
        ),
        side: BorderSide(
          color: isWhite ? AppColors.primaryColor : Colors.transparent,
        ),
      ),
      color: isWhite
          ? Theme.of(context).scaffoldBackgroundColor
          : isDisabled
              ? AppColors.primaryDisabledColor
              : AppColors.primaryColor,
      child: Text(
        title,
        style: Styles.textStyles14.copyWith(
          color: isWhite
              ? AppCubit.get(context).isDarkMode!
                  ? Colors.white
                  : Colors.black
              : Colors.white,
        ),
      ),
    );
  }
}
