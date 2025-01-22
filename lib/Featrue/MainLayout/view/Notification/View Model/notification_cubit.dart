import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:meta/meta.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzData;

import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/All Notification Model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);

  AllNotificationModel? allNotificationModel;

  static FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();
  var initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings());
  Future<void> getAllNotifications() async {
    emit(GetAllNotificationLoading());
    try {
      final response = await DioHelper.get(
        end_ponit: EndPoints.notifications,
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('notifications', response.data.toString());

      allNotificationModel = AllNotificationModel.fromJson(response.data);
      emit(GetAllNotificationSuccess());
    } catch (e) {
      print(e.toString());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('notifications')) {
        String? localData = prefs.getString('notifications');

        Map<String, dynamic> jsonMap = jsonDecode(localData!);

        allNotificationModel = AllNotificationModel.fromJson(jsonMap);
        emit(GetAllNotificationSuccess());
      } else {
        emit(GetAllNotificationError());
      }
    }
  }
  Future<void> connectToServer(String url, Map<String, String> headers) async {
    emit(NotificationLoading());
    try {
      localNotifications.initialize(initSettings);
      await requestPermission();

      await SSEClient.subscribeToSSE(
        method: SSERequestType.GET,
        url: "https://ls-fitness.koyeb.app/api/v1/notifications/event",
        header: {
          "Accept": "text/event-stream",
          "Cache-Control": "no-cache",
          "Authorization": "Bearer ${LoginCubit.token}", // Replace YOUR_JWT_TOKEN with the actual token
        },
      ).listen(
        (event) {
          if (event.data != null &&
              event.data!.isNotEmpty &&
              event.data != "Connection established") {
            Map<String, dynamic> jsonMap = jsonDecode(event.data!);

            showNotification('L.S Fitness', jsonMap['message']);
            emit(NotificationReceived(jsonMap['message']));
            getAllNotifications();
          }
        },
        onError: (error) {
          print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror');
          print("Error: $error");
          emit(NotificationError("Error: $error"));
        },
        onDone: () {
          print("Connection closed by server.");
          emit(NotificationError("Connection closed by server."));
        },
      );

      emit(NotificationConnected());
    } catch (e) {
      emit(NotificationError("Failed to connect: $e"));
    }
  }

  Future<void> requestPermission() async {
    var status = await Permission.notification.status;

    if (status.isDenied) {
      status = await Permission.notification.request();
    }

    if (status.isGranted) {
      debugPrint("Notifications permission granted");
    } else {
      debugPrint("Notifications permission denied");
    }
    emit(RequestPermissionState());
  }
  Future<void> showNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();
    const platformDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    await localNotifications.show(
      DateTime.now().millisecond,
      title,
      body,
      platformDetails,
    );

    emit(ShowNotificationState());
  }
  Future<void> MarkNotificationAsRead({required String id , required bool isRead}) async {
    isRead = true;
    emit(MarkNotificationAsReadLoading());
    try {
      await DioHelper.put(
        end_ponit: '${EndPoints.notifications}/$id',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );
      emit(MarkNotificationAsReadSuccess());

      getAllNotifications();
      emit(MarkNotificationAsReadSuccess());
    } catch (e) {
      isRead = false;

      emit(MarkNotificationAsReadError());
    }
  }
  Future<void> MarkAllNotificationAsRead() async {
    emit(MarkNotificationAsReadLoading());
    try {
      await DioHelper.put(
        end_ponit: '${EndPoints.notifications}',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );
      emit(MarkNotificationAsReadSuccess());

      getAllNotifications();
      emit(MarkNotificationAsReadSuccess());
    } catch (e) {
      emit(MarkNotificationAsReadError());
    }
  }
}
