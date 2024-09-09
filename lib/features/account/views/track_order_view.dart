import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/account/view_model/track_order_cubit/track_order_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/track_order_view_body.dart';
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/views/no_network_connection_view.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/generated/l10n.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? BlocProvider(
                create: (context) => TrackOrderCubit()..getUserOrder(),
                child: Scaffold(
                  appBar: customAppBar(
                    title: S.of(context).trackOrders,
                  ),
                  body: const TrackOrderViewBody(),
                ),
              )
            : const NoNetworkConnectionView();
      },
    );
  }
}
