import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebse_notification/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true, // if this is true then notification will show
      announcement: true, //this is usefull for airpods , siri etc
      badge: true, //show notification on app icon like whatsapp messages
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true, //notification sound
    );
//this condition is for android
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    }
    // this condition is for ios
    else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('user granted provisional permission ');
    } else {
      AppSettings.openAppSettings();
      print('user denied permission');
    }
  }

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();
    var initilizationSetting = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initilizationSetting,
      onDidReceiveNotificationResponse: (payload) {},
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen(
      (message) {
        if (Platform.isAndroid) {
          initLocalNotifications(context, message);
          showNotification(message);
          print(message.data['type']);
          print(message.data['']);
        }
      },
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    Future.delayed(
      Duration.zero,
      () {
        AndroidNotificationChannel channel = AndroidNotificationChannel(
          Random.secure().nextInt(100000).toString(),
          'High importance Notification',
          importance: Importance.max,
        );
        AndroidNotificationDetails androidNotificationDetails =
            AndroidNotificationDetails(
          channel.id.toString(),
          channel.name.toString(),
          channelDescription: 'Your channel Description',
          importance: Importance.high,
          priority: Priority.high,
          ticker: 'ticker',
        );

        const DarwinNotificationDetails darwinNotificationDetails =
            DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );

        NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails,
          iOS: darwinNotificationDetails,
        );

        _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails,
        );
      },
    );
  }

//  get device token
  Future getDeviceToken() async {
    String? token = await messaging.getToken();
    return token;
  }

// get device token if it is refreshed
  void isTokenRefresh() {
    messaging.onTokenRefresh.listen(
      (event) {
        event.toString();
      },
    );
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    //when app  is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }
    // when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) {
        handleMessage(context, event);
      },
    );
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'msg') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageScreen(id: message.data['learn']),
          ));
    }
  }
}
