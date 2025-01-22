import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Meal%20Alarms/Model/Meals%20Model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



part 'alarm_state.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmInitial());
  static AlarmCubit get(context) => BlocProvider.of(context);

  late SharedPreferences preferences;


  List<Meal> meals = [
    Meal(name: 'Before Exercise', time: '00:00' , id: 1, status: false),
    Meal(name: 'After Exercise', time: '00:00',id: 2, status: false),
    Meal(name: 'Snack 3', time: '00:00',id: 3, status: false),
    Meal(name: 'Ramadan Breakfast', time: '00:00',id: 4, status: false),
    Meal(name: 'Ramadan Suhoor', time: '00:00',id: 5, status: false),
  ];

  List<String> listofstring = [];

  Future<void> initializeMeals() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('meals');

    if (storedMeals == null) {
      setMeals();
    } else {
      meals = storedMeals.map((e) => Meal.fromJson(json.decode(e))).toList();
      emit(InitializeMeals());
    }
  }




  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  void setMeals() {
    List<String> mealStrings =
    meals.map((meal) => json.encode(meal.toJson())).toList();
    preferences.setStringList('meals', mealStrings);
    emit(SetMeals());
  }

  void updateMealTime(int index, String newTime) {
    meals[index].time = newTime;
    setMeals();
    emit(UpdateTime());
  }

  void updateMealStatus(int index, bool newStatus) {
    print('old status ${meals[index].status}');

    meals[index].status = newStatus;
    print('new status ${meals[index].status}');
    setMeals();
    emit(UpdateStatus());
  }


  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("meals");

    if (cominglist == null) {} else {
      meals = cominglist.map((e) => Meal.fromJson(json.decode(e[0]))).toList();
      emit(GetDataState());
    }
  }

  SetData() {
    listofstring = meals.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("meals", listofstring);

    emit(SetDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {

    meals.add(Meal(name: label , time: dateTime, id: id, status: check));
    emit(SetAlarm());
    SetData();
  }


  int generateUniqueId(List<Meal> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(1000);
    } while (meals.any((meal) => meal.id == id));

    return id;
  }

}
