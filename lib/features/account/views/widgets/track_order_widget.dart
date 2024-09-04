import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/app_constants.dart';
import 'package:online_shop/core/utils/functions.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/account/views/widgets/order_tracking_tile.dart';
import 'package:online_shop/features/checkout/models/order_model.dart';
import 'package:online_shop/generated/l10n.dart';

class TrackOrderWidget extends StatelessWidget {
  const TrackOrderWidget({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            order.orderStatus == AppConstants.orderSigned
                ? const OrderTrackingTile(
                    circleColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    lineColor: AppColors.borderGreyColor,
                  )
                : const OrderTrackingTile(
                    circleColor: AppColors.primaryColor,
                    borderColor: AppColors.borderGreyColor,
                    lineColor: AppColors.primaryColor,
                  ),
            order.orderStatus == AppConstants.orderProcessed
                ? const OrderTrackingTile(
                    circleColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    lineColor: AppColors.borderGreyColor,
                  )
                : order.orderStatus == AppConstants.orderSigned
                    ? const OrderTrackingTile(
                        circleColor: AppColors.greyColor,
                        borderColor: AppColors.borderGreyColor,
                        lineColor: AppColors.borderGreyColor,
                      )
                    : const OrderTrackingTile(
                        circleColor: AppColors.primaryColor,
                        borderColor: AppColors.borderGreyColor,
                        lineColor: AppColors.primaryColor,
                      ),
            order.orderStatus == AppConstants.shipped
                ? const OrderTrackingTile(
                    circleColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    lineColor: AppColors.borderGreyColor,
                  )
                : order.orderStatus == AppConstants.orderSigned ||
                        order.orderStatus == AppConstants.orderProcessed
                    ? const OrderTrackingTile(
                        circleColor: AppColors.greyColor,
                        borderColor: AppColors.borderGreyColor,
                        lineColor: AppColors.borderGreyColor,
                      )
                    : const OrderTrackingTile(
                        circleColor: AppColors.primaryColor,
                        borderColor: AppColors.borderGreyColor,
                        lineColor: AppColors.primaryColor,
                      ),
            order.orderStatus == AppConstants.outForDelivery
                ? const OrderTrackingTile(
                    circleColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    lineColor: AppColors.borderGreyColor,
                  )
                : order.orderStatus == AppConstants.orderSigned ||
                        order.orderStatus == AppConstants.orderProcessed ||
                        order.orderStatus == AppConstants.shipped
                    ? const OrderTrackingTile(
                        circleColor: AppColors.greyColor,
                        borderColor: AppColors.borderGreyColor,
                        lineColor: AppColors.borderGreyColor,
                      )
                    : const OrderTrackingTile(
                        circleColor: AppColors.primaryColor,
                        borderColor: AppColors.borderGreyColor,
                        lineColor: AppColors.primaryColor,
                      ),
            order.orderStatus == AppConstants.delivered
                ? const OrderTrackingTile(
                    isEnd: true,
                    circleColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    lineColor: AppColors.borderGreyColor,
                  )
                : order.orderStatus == AppConstants.orderSigned ||
                        order.orderStatus == AppConstants.orderProcessed ||
                        order.orderStatus == AppConstants.shipped ||
                        order.orderStatus == AppConstants.outForDelivery
                    ? const OrderTrackingTile(
                        isEnd: true,
                        circleColor: AppColors.greyColor,
                        borderColor: AppColors.borderGreyColor,
                        lineColor: AppColors.borderGreyColor,
                      )
                    : const OrderTrackingTile(
                        isEnd: true,
                        circleColor: AppColors.primaryColor,
                        borderColor: AppColors.borderGreyColor,
                        lineColor: AppColors.primaryColor,
                      ),
          ],
        ),
        const SizedBox(
          width: 40.0,
        ),
        Column(
          children: [
            SizedBox(
              height: isArabic() ? 0.0 : 7.0,
            ),
            Text(
              S.of(context).orderSigned,
              style: Styles.textStyles16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              order.orderDate,
              style: Styles.textStyles10.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 97.0,
            ),
            Text(
              S.of(context).orderProcessed,
              style: Styles.textStyles16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 113.0,
            ),
            Text(
              S.of(context).shipped,
              style: Styles.textStyles16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: isArabic() ? 109.0 : 112.0,
            ),
            Text(
              S.of(context).outForDelivery,
              style: Styles.textStyles16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 112.0,
            ),
            Text(
              S.of(context).delivered,
              style: Styles.textStyles16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
