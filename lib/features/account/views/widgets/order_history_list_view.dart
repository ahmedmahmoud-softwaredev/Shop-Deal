import 'package:flutter/material.dart';
import 'package:online_shop/features/account/view_model/order_history_cubit/order_history_cubit.dart';
import 'package:online_shop/features/account/views/widgets/track_order_list_view_component.dart';

class OrderHistoryListView extends StatelessWidget {
  const OrderHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        itemBuilder: (context, index) => TrackOrderListViewComponent(
          order: OrderHistoryCubit.get(context).userOrders[index],
          isClickable: false,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16.0,
        ),
        itemCount: OrderHistoryCubit.get(context).userOrders.length,
      ),
    );
  }
}
