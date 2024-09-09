import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/app_constants.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/checkout/models/order_model.dart';
import 'package:shop_deal/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:shop_deal/features/core/widgets/custom_cached_network_image.dart';
import 'package:shop_deal/generated/l10n.dart';

class TrackOrderListViewComponent extends StatelessWidget {
  const TrackOrderListViewComponent(
      {super.key, required this.order, this.isClickable = true});
  final OrderModel order;
  final bool isClickable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isClickable) {
          GoRouter.of(context).push(
            AppRouter.viewOrderView,
            extra: order,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: 150.0,
        decoration: BoxDecoration(
          color: AppCubit.get(context).isDarkMode!
              ? Colors.white.withOpacity(0.08)
              : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              4.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.orderId,
                  style: Styles.textStyles16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "${S.of(context).egp} ${double.parse(order.orderTotalPrice).toStringAsFixed(2)}",
                  style: Styles.textStyles14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 7.0,
                  ),
                  decoration: BoxDecoration(
                    color: order.orderStatus == AppConstants.delivered
                        ? AppColors.primaryColor
                        : AppColors.orangeColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        2.0,
                      ),
                    ),
                  ),
                  child: Text(
                    order.orderStatus == AppConstants.orderSigned
                        ? S.of(context).orderSigned
                        : order.orderStatus == AppConstants.orderProcessed
                            ? S.of(context).orderProcessed
                            : order.orderStatus == AppConstants.shipped
                                ? S.of(context).shipped
                                : order.orderStatus ==
                                        AppConstants.outForDelivery
                                    ? S.of(context).outForDelivery
                                    : S.of(context).delivered,
                    style: Styles.textStyles14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 105,
              width: 105,
              child: order.order.length > 1
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          order.order.length > 4 && index > 2
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: AppColors.borderGreyColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "+${order.order.length - 3}",
                                      style: Styles.textStyles14,
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      4.0,
                                    ),
                                  ),
                                  child: CustomCachedNetworkImage(
                                    imageUrl: order.order[index].productImage,
                                    width: 50.0,
                                    height: 50.0,
                                  ),
                                ),
                      itemCount:
                          order.order.length > 4 ? 4 : order.order.length,
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          4.0,
                        ),
                      ),
                      child: CustomCachedNetworkImage(
                        imageUrl: order.order[0].productImage,
                        width: 105.0,
                        height: 105.0,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
