import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ls/Featrue/MainLayout/view/Alarm%20Feature/View/Alarms%20Screen/Tabs/Alarm%20Feture/View/Alarms/Workout%20Alarms/Model/Workout%20Model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutInitial());

  List<Workout> workout = [
    Workout(name: 'MorningWorkout', time: '00:00', id: 61, status: false),
    Workout(name: 'NightWorkout', time: '00:00', id: 62, status: false),
    Workout(name: 'GymWorkout', time: '00:00', id: 63, status: false),
    Workout(name: 'HomeWorkout', time: '00:00', id: 64, status: false),
  ];


  static WorkoutCubit get(context) => BlocProvider.of(context);


  late SharedPreferences preferences;


  List<String> listofstring = [];


  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  Future<void> initializeWorkout() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('workout');

    if (storedMeals == null) {
      setMeals();
    } else {
      workout = storedMeals.map((e) => Workout.fromJson(json.decode(e))).toList();
      emit(InitializeWorkout());
    }
  }

  void setMeals() {
    List<String> mealStrings =
    workout.map((w) => json.encode(w.toJson())).toList();
    preferences.setStringList('workout', mealStrings);
    emit(SetWorkout());
  }

  void updateMealStatus(int index, bool newStatus) {
    print('old status ${workout[index].status}');

    workout[index].status = newStatus;
    print('new status ${workout[index].status}');
    setMeals();
    emit(UpdateStatus());
  }

  void updateMealTime(int index, String newTime) {
    workout[index].time = newTime;
    setMeals();
    emit(UpdateWorkoutTime());
  }


  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("workout");

    if (cominglist == null) {} else {
      workout = cominglist.map((e) => Workout.fromJson(json.decode(e))).toList();
      emit(GetWorkoutDataState());
    }
  }

  SetData() {
    listofstring = workout.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("workout", listofstring);

    emit(SetWorkoutDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    workout.add(Workout(name: label , time: dateTime, id: id, status: check));
    emit(SetWorkoutAlarm());
    SetData();
  }


  int generateUniqueId(List<Workout> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(100);
    } while (meals.any((meal) => meal.id == id));

    return id;
  }
}
