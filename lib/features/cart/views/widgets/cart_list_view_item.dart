import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/cart/models/cart_item_model.dart';
import 'package:shop_deal/features/cart/views/widgets/counter_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/generated/l10n.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({
    super.key,
    required this.cartItem,
    required this.index,
    required this.startAnimation,
  });
  final CartItemModel cartItem;
  final int index;
  final bool startAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 120.0,
      curve: Curves.easeIn,
      duration: Duration(
        milliseconds: 150 + (index * 180),
      ),
      transform: Matrix4.translationValues(
          startAnimation ? 0 : MediaQuery.of(context).size.width,
          startAnimation ? 0 : 80,
          0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                4.0,
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: cartItem.product.image,
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
                Text(
                  cartItem.product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyles16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  "${S.of(context).egp} ${cartItem.product.price}",
                  style: Styles.textStyles16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                CounterWidget(
                  index: index,
                  cartItem: cartItem,
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
