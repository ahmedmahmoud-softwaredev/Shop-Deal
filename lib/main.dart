import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_deal/core/helpers/hive_helper.dart';
import 'package:shop_deal/core/helpers/notifications_helper.dart';
import 'package:shop_deal/core/helpers/shared_preferences_helper.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/models/notification_model.dart';
import 'package:shop_deal/firebase_options.dart';
import 'package:shop_deal/shop_deal_app.dart';

Future<void> handleNotificationOnterminatedApp(
    RemoteMessage? remoteMessage) async {
  NotificationModel notification = NotificationModel(
    title: remoteMessage!.notification!.title!,
    content: remoteMessage.notification!.body!,
    image: remoteMessage.notification!.android?.imageUrl,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(NotificationModelAdapter());
  await Hive.openBox<NotificationModel>(kNotificationsBox);
  var notificationsBox = Hive.box<NotificationModel>(kNotificationsBox);
  await notificationsBox.add(notification);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationsHelper().init();
  await SharedPreferencesHelper.init();
  await HiveHelper.init();
  setup();
  runApp(const ShopDealApp());
}
