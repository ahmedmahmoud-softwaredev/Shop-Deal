import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/app_router.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/core/widgets/custom_error_widget.dart';
import 'package:online_shop/features/core/widgets/custom_loading_widget.dart';
import 'package:online_shop/features/explore/models/product_model.dart';
import 'package:online_shop/generated/l10n.dart';

class WishlistComponent extends StatelessWidget {
  const WishlistComponent({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.itemDetailsView, extra: product);
      },
      child: SizedBox(
        height: 120.0,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  4.0,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: product.image,
                placeholder: (context, url) => const CustomLoadingWidget(),
                errorWidget: (context, url, error) => const CustomErrorWidget(),
                width: 120.0,
                height: 120.0,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyles16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    "${S.of(context).egp} ${product.price}",
                    style: Styles.textStyles16.copyWith(
                      fontWeight: FontWeight.w500,
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
                      color: product.isInStock
                          ? AppColors.primaryColor
                          : AppColors.orangeColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      product.isInStock
                          ? S.of(context).inStock
                          : S.of(context).outOfStock,
                      style: Styles.textStyles14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
