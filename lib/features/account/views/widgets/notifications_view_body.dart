import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/account/view_model/notifications_cubit/notifications_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/notifications_list_view.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/empty_widget.dart';
import 'package:shop_deal/generated/l10n.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsCubit, NotificationsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetNotificationsLoadingState) {
          return const CustomLoadingWidget();
        } else if (state is GetNotificationsFailureState) {
          return const CustomErrorWidget();
        } else {
          return NotificationsCubit.get(context).notifications.isNotEmpty
              ? const NotificationsListView()
              : EmptyWidget(
                  text: S.of(context).youDonotHaveAnyNotificationsYet,
                );
        }
      },
    );
  }
}
