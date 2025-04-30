import 'dart:convert';

import 'package:firebse_notification/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then(
      (value) {
        print('Device token');
        print(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              notificationServices.getDeviceToken().then(
                (value) async {
                  var data = {
                    'to': value.toString(),
                    'priority': 'high',
                    'notification': {
                      'title': 'Saqib',
                      'body': 'my name is saqib ali'
                    },
                    'data': {
                      'type': 'message',
                      'id': 'saqibali12345',
                      //anything for this
                      'extra': 'anything'
                    }
                  };
                  await http.post(
                      Uri.parse('https://fcm.googleapis.com/fcm/send'),
                      body: jsonEncode(data),
                      headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                        'Authorization': 'key=hhhhhhhhhhhhhhhhhhhhhhhhhhh'
                      });
                },
              );
            },
            child: Text('Send notification')),
      ),
    );
  }
}
