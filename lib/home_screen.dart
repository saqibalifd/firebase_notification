import 'package:firebse_notification/services/get_server_key_sevice.dart';
import 'package:firebse_notification/services/notification_services.dart';
import 'package:firebse_notification/services/send_notification_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //setup for initilinzing of your main screen code
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.getDeviceToken();
    // FcmService.firebaseInit();
    notificationServices.firebaseInit(context);
    notificationServices.setupIntractMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    final String token =
        'evIDS-OtRUSZKOpuUiG1Fs:APA91bGQhPmlwUdCHuwT87J4VR8cMRp5nuvMUy0ZBX7bth1oMUFNezo2JA3KLoga4PhEA0SD_99qOi8GWgFkIk5vQLKigqYl5SlOyfIvUI3cOxHX2zA0enc';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // get server key button
          Text('Get Server key button'),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () async {
                  GetServerKeySevice getServerKeySevice = GetServerKeySevice();
                  String serverKey =
                      await getServerKeySevice.getServerKeyToken();
                  print('Server Key: $serverKey');
                },
                child: Text('Get Server Key',
                    style: TextStyle(color: Colors.white))),
          ),

          Text('Simple notification button'),

          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () async {
                  await SendNotificationService.sendNotificationUsingApi(
                    token: token,
                    title: 'Test notification',
                    body: 'This is simple notification',
                    data: {},
                  );
                },
                child: Text('Send Notification',
                    style: TextStyle(color: Colors.white))),
          ),
          Text('Message Screen Notification button'),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () async {
                  await SendNotificationService.sendNotificationUsingApi(
                    token: token,
                    title: 'Test notification',
                    body: 'This notification navigate to message screen',
                    data: {
                      'screen': 'message',
                    },
                  );
                },
                child: Text('Send Notification',
                    style: TextStyle(color: Colors.white))),
          ),
          Text('Notification Screen Notification button'),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () async {
                  await SendNotificationService.sendNotificationUsingApi(
                    token: token,
                    title: 'Test notification',
                    body: 'This notification navigate to notification screen',
                    data: {
                      'screen': 'notification',
                    },
                  );
                },
                child: Text('Send Notification',
                    style: TextStyle(color: Colors.white))),
          ),
          Text('Send Notification to all users'),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: () async {
                  await SendNotificationService
                      .sendNotificationUsingApiToAllUsers(
                    title: 'Test notification',
                    body: 'This notification is for all users',
                    data: {
                      'screen': 'notification',
                    },
                  );
                },
                child: Text('Send Notification',
                    style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
    );
  }
}
