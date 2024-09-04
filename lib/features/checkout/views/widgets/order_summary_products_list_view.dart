import 'package:flutter/material.dart';
import 'package:online_shop/features/cart/models/cart_item_model.dart';
import 'package:online_shop/features/checkout/views/widgets/order_summary_product_widget.dart';

class OrderSummaryProductsListView extends StatelessWidget {
  const OrderSummaryProductsListView({
    super.key,
    required this.order,
  });
  final List<CartItemModel> order;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.0,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => OrderSummaryProductWidget(
          product: order[index].product,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 15.0,
        ),
        itemCount: order.length,
      ),
    );
  }
}
