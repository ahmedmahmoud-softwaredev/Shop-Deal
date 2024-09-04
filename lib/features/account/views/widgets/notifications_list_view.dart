import 'package:flutter/material.dart';
import 'package:online_shop/features/account/view_model/notifications_cubit/notifications_cubit.dart';
import 'package:online_shop/features/account/views/widgets/notifications_list_view_item.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      itemBuilder: (context, index) => NotificationsListViewItem(
          notification: NotificationsCubit.get(context).notifications[index]),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16.0,
      ),
      itemCount: NotificationsCubit.get(context).notifications.length,
    );
  }
}
