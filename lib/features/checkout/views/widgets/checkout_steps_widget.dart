import 'package:flutter/material.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/functions.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/account/views/widgets/tracking_circle_widget.dart';
import 'package:online_shop/features/checkout/views/widgets/checkout_step_widget.dart';
import 'package:online_shop/generated/l10n.dart';

class CheckOutStepsWidget extends StatelessWidget {
  const CheckOutStepsWidget({super.key, required this.stepIndex});
  final int stepIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: isArabic() ? MediaQuery.of(context).size.width * 0.032 : 0.0,
        left: isArabic() ? 0 : MediaQuery.of(context).size.width * 0.032,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isArabic()
                  ? MediaQuery.of(context).size.width * 0.015
                  : MediaQuery.of(context).size.width * 0.04,
            ),
            child: Row(
              children: [
                stepIndex == 0
                    ? const Expanded(
                        child: CheckoutStepWidget(
                          circleColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
                          lineColor: AppColors.borderGreyColor,
                        ),
                      )
                    : const Expanded(
                        child: CheckoutStepWidget(
                          circleColor: AppColors.primaryColor,
                          borderColor: AppColors.borderGreyColor,
                          lineColor: AppColors.primaryColor,
                        ),
                      ),
                stepIndex == 1
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: isArabic() ? 16.0 : 0.0,
                          right: isArabic() ? 0.0 : 16.0,
                        ),
                        child: const TrackingCircleWidget(
                          circleColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          left: isArabic() ? 16.0 : 0.0,
                          right: isArabic() ? 0.0 : 16.0,
                        ),
                        child: const TrackingCircleWidget(
                          circleColor: AppColors.greyColor,
                          borderColor: AppColors.borderGreyColor,
                        ),
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: isArabic()
                  ? MediaQuery.of(context).size.width * 0.019
                  : MediaQuery.of(context).size.width * 0.015,
              left: MediaQuery.of(context).size.width * 0.029,
            ),
            child: Row(
              children: [
                Text(
                  S.of(context).address,
                  style: Styles.textStyles12,
                ),
                const Spacer(),
                Text(
                  S.of(context).paymentMethod,
                  style: Styles.textStyles12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
