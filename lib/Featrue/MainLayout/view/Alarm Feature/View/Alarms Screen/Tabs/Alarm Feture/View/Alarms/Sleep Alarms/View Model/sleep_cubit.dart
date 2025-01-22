import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Sleep Model.dart';

part 'sleep_state.dart';

class SleepCubit extends Cubit<SleepState> {
  SleepCubit() : super(SleepInitial());

  static SleepCubit get(context) => BlocProvider.of(context);


  late SharedPreferences preferences;


  List<String> listofstring = [];

  List<Sleep> sleep = [
    Sleep(name: 'Wake Up', time: '00:00', id: 52, status: false),
    Sleep(name: 'Sleep', time: '00:00', id: 53, status: false),
    Sleep(name: 'Nap', time: '00:00', id: 54, status: false),
  ];


  Future<void> initializeSleep() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('sleep');

    if (storedMeals == null) {
      setMeals();
    } else {
      sleep = storedMeals.map((e) => Sleep.fromJson(json.decode(e))).toList();
      emit(InitializeSleep());
    }
  }

  void updateMealStatus(int index, bool newStatus) {
    print('old status ${sleep[index].status}');

    sleep[index].status = newStatus;
    print('new status ${sleep[index].status}');
    setMeals();
    emit(UpdateStatus());
  }

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  void setMeals() {
    List<String> mealStrings =
    sleep.map((s) => json.encode(s.toJson())).toList();
    preferences.setStringList('sleep', mealStrings);
    emit(SetSleep());
  }

  void updateMealTime(int index, String newTime) {
    sleep[index].time = newTime;
    setMeals();
    emit(UpdateSleepTime());
  }


  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("sleep");

    if (cominglist == null) {} else {
      sleep = cominglist.map((e) => Sleep.fromJson(json.decode(e))).toList();
      emit(GetSleepDataState());
    }
  }

  SetData() {
    listofstring = sleep.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("sleep", listofstring);

    emit(SetSleepDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    sleep.add(Sleep(name: label , time: dateTime, id: id, status: check));
    emit(SetSleepAlarm());
    SetData();
  }


  int generateUniqueId(List<Sleep> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(100);
    } while (meals.any((meal) => meal.id == id));

    return id;
  }

}
