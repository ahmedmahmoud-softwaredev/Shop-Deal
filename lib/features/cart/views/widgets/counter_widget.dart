import 'package:flutter/material.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/cart/models/cart_item_model.dart';
import 'package:shop_deal/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:shop_deal/features/core/view_model/app_cubit/app_cubit.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, required this.index, required this.cartItem});

  final int index;
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      decoration: BoxDecoration(
        color: AppCubit.get(context).isDarkMode!
            ? Colors.white.withOpacity(0.3)
            : Colors.black.withOpacity(0.06),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            4.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              updateQuantity(context: context, quantity: ++cartItem.quantity);
            },
            icon: const Icon(
              Icons.add,
              size: 20.0,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            cartItem.quantity.toString(),
            style: Styles.textStyles16,
          ),
          const SizedBox(
            width: 10.0,
          ),
          IconButton(
            onPressed: () {
              if (cartItem.quantity > 1) {
                updateQuantity(context: context, quantity: --cartItem.quantity);
              }
            },
            icon: const Icon(
              Icons.remove,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  void updateQuantity({required BuildContext context, required int quantity}) {
    CartItemModel item = cartItem.copyWith(quantity: quantity);
    sl<CartCubit>().editCartItemQuantity(index: index, cartItem: item);
  }
}
