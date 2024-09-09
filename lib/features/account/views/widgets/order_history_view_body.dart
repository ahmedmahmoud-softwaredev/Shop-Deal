import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/account/view_model/order_history_cubit/order_history_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/order_history_list_view.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/empty_widget.dart';
import 'package:shop_deal/generated/l10n.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetUserOrdersLoadingState) {
          return const CustomLoadingWidget();
        } else if (state is GetUserOrdersFailureState) {
          return const CustomErrorWidget();
        } else {
          return OrderHistoryCubit.get(context).userOrders.isNotEmpty
              ? const OrderHistoryListView()
              : EmptyWidget(
                  text: S.of(context).youDonotHaveAnyOrdersYet,
                );
        }
      },
    );
  }
}
