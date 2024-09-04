import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/features/account/models/notification_model.dart';
import 'package:online_shop/main.dart';

class NotificationsHelper {
  final firebaseMessaging = FirebaseMessaging.instance;
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    firebaseMessaging.requestPermission().then((value) async {
      if (value.authorizationStatus == AuthorizationStatus.authorized) {
        await tokenHandle();
        initLocalNotifications();
        await onBackgroundHandleNotification();
        await onForegroundHandleNotification();
      }
    }).catchError((error) {});
  }

  Future<void> handleNotification(RemoteMessage? remoteMessage) async {}

  Future<void> onBackgroundHandleNotification() async {
    firebaseMessaging.getInitialMessage().then(handleNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotification);
    FirebaseMessaging.onBackgroundMessage(handleNotificationOnterminatedApp);
  }

  Future<void> onForegroundHandleNotification() async {
    FirebaseMessaging.onMessage.listen(showLocalNotification);
  }

  Future<void> showLocalNotification(RemoteMessage? remoteMessage) async {
    if (remoteMessage != null) {
      NotificationModel notification = NotificationModel(
        title: remoteMessage.notification!.title!,
        content: remoteMessage.notification!.body!,
        image: remoteMessage.notification!.android!.imageUrl,
      );
      var notificationsBox =
          await Hive.openBox<NotificationModel>(kNotificationsBox);
      await notificationsBox.add(notification);
      const AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        "localNotification",
        "localNotification",
        playSound: true,
        importance: Importance.max,
        priority: Priority.max,
      );
      const DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails();
      const NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: darwinNotificationDetails);
      await flutterLocalNotificationsPlugin.show(
          0,
          remoteMessage.notification?.title,
          remoteMessage.notification?.body,
          notificationDetails);
    }
  }

  void initLocalNotifications() {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("mipmap/ic_notification");
    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> tokenHandle() async {
    kFCMToken = await firebaseMessaging.getToken();
    FirebaseMessaging.instance.onTokenRefresh.listen(updateUserToken);
  }

  Future<void> updateUserToken(String newFCMToken) async {
    final firebaseFirestore = FirebaseFirestore.instance;
    if (currentUser != null) {
      kFCMToken = newFCMToken;
      await firebaseFirestore
          .collection(usersCollection)
          .doc(currentUser!.uid)
          .update(
        {
          "fcmToken": newFCMToken,
        },
      );
    } else {
      kFCMToken = newFCMToken;
    }
  }
}
