import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/account/view_model/track_order_cubit/track_order_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/track_order_list_view.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/empty_widget.dart';
import 'package:shop_deal/generated/l10n.dart';

class TrackOrderViewBody extends StatelessWidget {
  const TrackOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackOrderCubit, TrackOrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetUserOrdersLoadingState) {
          return const CustomLoadingWidget();
        } else if (state is GetUserOrdersFailureState) {
          return const CustomErrorWidget();
        } else {
          return TrackOrderCubit.get(context).userOrders.isNotEmpty
              ? const TrackOrderListView()
              : EmptyWidget(
                  text: S.of(context).youDonotHaveAnyOrdersYet,
                );
        }
      },
    );
  }
}
