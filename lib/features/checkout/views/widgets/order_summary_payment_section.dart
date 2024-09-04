import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/checkout/models/payment_method_model.dart';
import 'package:online_shop/generated/l10n.dart';

class OrderSummaryPaymentSection extends StatelessWidget {
  const OrderSummaryPaymentSection({
    super.key,
    required this.paymentMethod,
  });
  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).paymentMethod,
            style: Styles.textStyles18,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                paymentMethod.icon,
                width: 60.0,
                height: 43.0,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                paymentMethod.title,
                style: Styles.textStyles18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.check_circle,
                color: AppColors.primaryColor,
                size: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
