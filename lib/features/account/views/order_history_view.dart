import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/account/view_model/order_history_cubit/order_history_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/order_history_view_body.dart';
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/views/no_network_connection_view.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/generated/l10n.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? BlocProvider(
                create: (context) => OrderHistoryCubit()..getUserOrder(),
                child: Scaffold(
                  appBar: customAppBar(
                    title: S.of(context).ordersHistory,
                  ),
                  body: const OrderHistoryViewBody(),
                ),
              )
            : const NoNetworkConnectionView();
      },
    );
  }
}
