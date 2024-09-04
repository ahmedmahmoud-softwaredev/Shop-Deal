import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/features/account/views/widgets/view_order_view_body.dart';
import 'package:online_shop/features/checkout/models/order_model.dart';
import 'package:online_shop/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:online_shop/features/core/views/no_network_connection_view.dart';
import 'package:online_shop/features/core/widgets/custom_appbar.dart';

class ViewOrderView extends StatelessWidget {
  const ViewOrderView({
    super.key,
    required this.order,
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? Scaffold(
                appBar: customAppBar(
                  title: order.orderId,
                ),
                body: ViewOrderViewBody(
                  order: order,
                ),
              )
            : const NoNetworkConnectionView();
      },
    );
  }
}
