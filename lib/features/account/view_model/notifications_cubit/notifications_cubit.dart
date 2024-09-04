import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/features/account/models/notification_model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitialState());
  static NotificationsCubit get(context) => BlocProvider.of(context);
  List<NotificationModel> notifications = [];
  void getNotifications() async {
    emit(GetNotificationsLoadingState());
    try {
      var notificationsBox = Hive.box<NotificationModel>(kNotificationsBox);
      notifications = notificationsBox.values.toList();
      emit(GetNotificationsSuccessState());
    } catch (error) {
      emit(
        GetNotificationsFailureState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
