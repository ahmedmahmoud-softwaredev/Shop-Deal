import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/checkout/models/payment_method_model.dart';

class PaymentStepSelectionMethodWidget extends StatelessWidget {
  const PaymentStepSelectionMethodWidget({
    super.key,
    required this.paymentMethod,
    required this.isSelected,
    required this.onPressed,
  });
  final PaymentMethodModel paymentMethod;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 14.0,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.3)
              : Colors.transparent,
          border: Border.all(
            color: AppColors.borderGreyColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              4.0,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              paymentMethod.icon,
              width: 40.0,
              height: 40.0,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              paymentMethod.title,
              style: Styles.textStyles18,
            ),
          ],
        ),
      ),
    );
  }
}
