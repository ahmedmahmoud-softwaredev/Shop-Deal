import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/core/widgets/custom_cached_network_image.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/generated/l10n.dart';

class OrderSummaryProductWidget extends StatelessWidget {
  const OrderSummaryProductWidget({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.itemDetailsView,
          extra: product,
        );
      },
      child: SizedBox(
        width: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  4.0,
                ),
              ),
              child: CustomCachedNetworkImage(
                imageUrl: product.image,
                width: 120.0,
                height: 120.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              product.title,
              style: Styles.textStyles16.copyWith(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              "${S.of(context).egp} ${product.price}",
              style: Styles.textStyles16.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
