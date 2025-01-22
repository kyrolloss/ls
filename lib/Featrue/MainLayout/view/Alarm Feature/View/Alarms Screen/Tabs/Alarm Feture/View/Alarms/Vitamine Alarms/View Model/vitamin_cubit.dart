import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Model/Vitamin Model.dart';

part 'vitamin_state.dart';

class VitaminCubit extends Cubit<VitaminState> {
  VitaminCubit() : super(VitaminInitial());

  static VitaminCubit get(context) => BlocProvider.of(context);

  late SharedPreferences preferences;

  List<Vitamin> vitamin = [
    Vitamin(name: 'Vitamin A', time: '00:00', id: 55, status: false),
    Vitamin(name: 'Vitamin C', time: '00:00', id: 56, status: false),
    Vitamin(name: 'Vitamin D', time: '00:00', id: 57, status: false),
    Vitamin(name: 'Vitamin E', time: '00:00', id: 58, status: false),
    Vitamin(name: 'Vitamin B Complex', time: '00:00', id: 59, status: false),
    Vitamin(name: 'omega 3', time: '00:00', id: 60, status: false),
  ];



  void updateMealStatus(int index, bool newStatus) {
    print('old status ${vitamin[index].status}');

    vitamin[index].status = newStatus;
    print('new status ${vitamin[index].status}');
    setMeals();
    emit(UpdateStatus());
  }

  List<String> listofstring = [];

  Future<void> initializeVitamin() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('vitamin');

    if (storedMeals == null) {
      setMeals();
    } else {
      vitamin =
          storedMeals.map((e) => Vitamin.fromJson(json.decode(e))).toList();
      emit(InitializeVitamin());
    }
  }

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  void setMeals() {
    List<String> mealStrings =
        vitamin.map((meal) => json.encode(meal.toJson())).toList();
    preferences.setStringList('vitamin', mealStrings);
    emit(SetVitamin());
  }

  void updateMealTime(int index, String newTime) {
    vitamin[index].time = newTime;
    setMeals();
    emit(UpdateTime());
  }

  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("vitamin");

    if (cominglist == null) {
    } else {
      vitamin =
          cominglist.map((e) => Vitamin.fromJson(json.decode(e[0]))).toList();
      emit(GetDataState());
    }
  }

  SetData() {
    listofstring = vitamin.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("vitamin", listofstring);

    emit(SetDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    vitamin.add(Vitamin(name: label, time: dateTime, id: id, status: check));
    emit(SetAlarm());
    SetData();
  }

  int generateUniqueId(List<Vitamin> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(100);
    } while (meals.any((vitamin) => vitamin.id == id));

    return id;
  }
}
