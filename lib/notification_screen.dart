import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final RemoteMessage? message;
  const NotificationScreen({super.key, this.message});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification Screen'),
          centerTitle: true,
        ),
        body: widget.message == null
            ? const Center(
                child: Text('No Notification'),
              )
            : ListView(
                children: [
                  const SizedBox(height: 20),
                  const Text('Notification'),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: const Icon(Icons.notifications),
                      title:
                          Text(widget.message!.notification!.title.toString()),
                      subtitle: Text(
                        widget.message!.notification!.body.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(widget.message!.data['screen'].toString()),
                    ),
                  )
                ],
              ));
  }
}
