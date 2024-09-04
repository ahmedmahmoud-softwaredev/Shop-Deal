import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/features/account/view_model/notifications_cubit/notifications_cubit.dart';
import 'package:online_shop/features/account/views/widgets/notifications_view_body.dart';
import 'package:online_shop/features/core/widgets/custom_appbar.dart';
import 'package:online_shop/generated/l10n.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit()..getNotifications(),
      child: Scaffold(
        appBar: customAppBar(
          title: S.of(context).notifications,
        ),
        body: const NotificationsViewBody(),
      ),
    );
  }
}
