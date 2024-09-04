import 'package:flutter/material.dart';
import 'package:online_shop/features/account/views/widgets/track_order_widget.dart';
import 'package:online_shop/features/checkout/models/order_model.dart';

class ViewOrderViewBody extends StatelessWidget {
  const ViewOrderViewBody({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TrackOrderWidget(
        order: order,
      ),
    );
  }
}
