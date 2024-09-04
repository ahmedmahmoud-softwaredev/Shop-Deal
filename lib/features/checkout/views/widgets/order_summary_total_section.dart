import 'package:flutter/material.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:online_shop/generated/l10n.dart';

class OrderSummaryTotalSection extends StatelessWidget {
  const OrderSummaryTotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).total,
            style: Styles.textStyles20.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${S.of(context).egp} ${double.parse(sl<CartCubit>().totalPrice.toStringAsFixed(2))}",
            style: Styles.textStyles26.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
