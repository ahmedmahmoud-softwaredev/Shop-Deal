import 'package:flutter/material.dart';
import 'package:online_shop/features/account/view_model/track_order_cubit/track_order_cubit.dart';
import 'package:online_shop/features/account/views/widgets/track_order_list_view_component.dart';

class TrackOrderListView extends StatelessWidget {
  const TrackOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        itemBuilder: (context, index) => TrackOrderListViewComponent(
          order: TrackOrderCubit.get(context).userOrders[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16.0,
        ),
        itemCount: TrackOrderCubit.get(context).userOrders.length,
      ),
    );
  }
}
