import 'package:flutter/material.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSE Notifications',
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    _listenToNotifications();
  }

  void _listenToNotifications() {
    // استبدل هذا بـ URL الخاص بك
    String url = 'https://api.ls-fitnes.com/api/v1/notifications/event';

    // إعداد الاستماع للإشعارات
    SSEClient.subscribeToSSE(
      method: SSERequestType.GET,
      url: url,
      header: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzAxNDliZDg4NjJiZWRkZmU2Y2E0NWMiLCJpYXQiOjE3MzY4MTU2MTMsImV4cCI6MTc0NDU5MTYxM30.V83qgku6t-mbbnxxPKl9puEApqaXDjYtTWBfUtGnePg", // Replace YOUR_JWT_TOKEN with the actual token
        "Accept": "text/event-stream",
        "Cache-Control": "no-cache",
      },
    ).listen(
          (event) {
        // معالجة البيانات المستلمة
        print('Id: ${event.id}');
        print('Event: ${event.event}');
        print('Data: ${event.data}');
      },
      onError: (error) {
        print('Error: $error');
      },
      onDone: () {
        print('Connection closed');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SSE Notifications'),
      ),
      body: Center(
        child: Text('Listening for notifications...'),
      ),
    );
  }
}