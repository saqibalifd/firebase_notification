import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebse_notification/firebase_options.dart';
import 'package:firebse_notification/home_screen.dart';
import 'package:flutter/material.dart';

// make a entery point for handling bacground message
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // pass handler
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscribe();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.w400),
            titleMedium: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        home: HomeScreen());
  }
}

// send notification to group of users
void subscribe() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.subscribeToTopic('all');
  print('Subscribed to topic');
}
