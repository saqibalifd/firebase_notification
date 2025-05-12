import 'dart:convert';

import 'package:firebse_notification/services/get_server_key_sevice.dart';
import 'package:http/http.dart' as http;

class SendNotificationService {
  static Future<void> sendNotificationUsingApi({
    required String? token,
    required String? title,
    required String? body,
    required Map<String, dynamic>? data,
  }) async {
    String serverKey = await GetServerKeySevice().getServerKeyToken();
    String url =
        'https://fcm.googleapis.com/v1/projects/fir-notification-1a116/messages:send';
    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    };
// message
    Map<String, dynamic> message = {
      "message": {
        "token": token,
        "notification": {
          "body": body,
          "title": title,
        },
        "data": data,
      },
    };

    // hit api
    final http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(message));

    if (response.statusCode == 200) {
      print('notification sent successfully');
    } else {
      print('Notification not sent');
    }
  }

  static Future<void> sendNotificationUsingApiToAllUsers({
    required String? title,
    required String? body,
    required Map<String, dynamic>? data,
  }) async {
    String serverKey = await GetServerKeySevice().getServerKeyToken();
    String url =
        'https://fcm.googleapis.com/v1/projects/fir-notification-1a116/messages:send';
    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    };
// message
    Map<String, dynamic> message = {
      "message": {
        "topic": 'all',
        "notification": {
          "body": body,
          "title": title,
        },
        "data": data,
      },
    };

    // hit api
    final http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(message));

    if (response.statusCode == 200) {
      print('notification sent successfully');
    } else {
      print('Notification not sent');
    }
  }
}
