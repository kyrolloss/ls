import 'package:flutter/material.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> notifications = [];

  @override
  void initState() {
    super.initState();
    _subscribeToNotifications();
  }

  void _subscribeToNotifications() {
    SSEClient.subscribeToSSE(
      method: SSERequestType.GET,
      url: 'https://ls-fitness.koyeb.app/api/v1/notifications/event',
      header: {
        "Accept": "text/event-stream",
        "Cache-Control": "no-cache",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzAxNDliZDg4NjJiZWRkZmU2Y2E0NWMiLCJpYXQiOjE3MzY4NzcyODMsImV4cCI6MTc0NDY1MzI4M30.Yq8Al3uvIq587Ma-ouTIzJIKw5Sg-VDdNmd0qKYf7yY", // Replace YOUR_JWT_TOKEN with the actual token
      },
    ).listen((event) {
      setState(() {
        notifications.add(event.data ?? "No data");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}