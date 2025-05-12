import 'package:firebse_notification/services/get_server_key_sevice.dart';
import 'package:firebse_notification/services/notification_services.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  GetServerKeySevice getServerKeySevice = GetServerKeySevice();
                  String serverKey =
                      await getServerKeySevice.getServerKeyToker();
                  print('Server Key: $serverKey');
                },
                child: Text('Get Server Key')),
          ),
        ],
      ),
    );
  }
}
