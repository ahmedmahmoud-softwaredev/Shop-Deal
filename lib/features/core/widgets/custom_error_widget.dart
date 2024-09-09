import 'package:flutter/material.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.size = 24.0});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error,
        color: AppColors.redColor,
        size: size,
      ),
    );
  }
}
