import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Sleep Alarms/Model/Sleep Model.dart';
import '../Model/Supplement.dart';

part 'supplements_state.dart';

class SupplementsCubit extends Cubit<SupplementsState> {
  SupplementsCubit() : super(SupplementsInitial());

  List<Supplement> supplements = [
    Supplement(name: 'Potassium Chloride', time: '00:00', id: 8, status: false),
    Supplement(name: 'Potassium Bicarbonate', time: '00:00', id: 9, status: false),
    Supplement(name: 'Potassium Phosphate', time: '00:00', id: 10, status: false),
    Supplement(name: 'Potassium Citrate', time: '00:00', id: 11, status: false),
    Supplement(name: 'Potassium Gluconate', time: '00:00', id: 12, status: false),
    Supplement(name: 'Potassium Orotate', time: '00:00', id: 13, status: false),
    Supplement(name: 'Beta-Sitosterol', time: '00:00', id: 14, status: false),
    Supplement(name: 'CranRich', time: '00:00', id: 15, status: false),
    Supplement(name: 'Alpha-Lipoic Acid 150', time: '00:00', id: 16, status: false),
    Supplement(name: 'Potassium', time: '00:00', id: 17, status: false),
    Supplement(name: 'Ashwagandha', time: '00:00', id: 18, status: false),
    Supplement(name: 'Vitamin C', time: '00:00', id: 19, status: false),
    Supplement(name: 'Tongkat ali', time: '00:00', id: 20, status: false),
    Supplement(name: 'Omega 3', time: '00:00', id: 21, status: false),
    Supplement(name: 'Zinc', time: '00:00', id: 22, status: false),
    Supplement(name: 'Multivitamin', time: '00:00', id: 23, status: false),
    Supplement(name: 'Magnesium Citrate', time: '00:00', id: 24, status: false),
    Supplement(name: 'Magnesium Glycinate', time: '00:00', id: 25, status: false),
    Supplement(name: 'Magnesium Oxide', time: '00:00', id: 26, status: false),
    Supplement(name: 'Magnesium Tauronate', time: '00:00', id: 27, status: false),
    Supplement(name: 'Magnesium Malate', time: '00:00', id: 28, status: false),
    Supplement(name: 'Magnesium Chloride', time: '00:00', id: 29, status: false),
    Supplement(name: 'Melatonin', time: '00:00', id: 30, status: false),
    Supplement(name: 'N-AcetylLcysteine , NAC', time: '00:00', id: 31, status: false),
    Supplement(name: 'Vitamin K', time: '00:00', id: 32, status: false),
    Supplement(name: 'Vitamin K2', time: '00:00', id: 33, status: false),
    Supplement(name: 'Vitamin D3', time: '00:00', id: 34, status: false),
    Supplement(name: 'D3-K2', time: '00:00', id: 35, status: false),
    Supplement(name: 'Calcium', time: '00:00', id: 36, status: false),
    Supplement(name: 'Vitamin A', time: '00:00', id: 37, status: false),
    Supplement(name: 'Vitamin E', time: '00:00', id: 38, status: false),
    Supplement(name: 'E 400', time: '00:00', id: 39, status: false),
    Supplement(name: 'B-50 (B-Complex)', time: '00:00', id: 40, status: false),
    Supplement(name: 'B-Complex', time: '00:00', id: 41, status: false),
    Supplement(name: 'B1-Thiamine', time: '00:00', id: 42, status: false),
    Supplement(name: 'B2-Riboflavin', time: '00:00', id: 43, status: false),
    Supplement(name: 'B3-Niacin', time: '00:00', id: 44, status: false),
    Supplement(name: 'B5-Pantothenic Acid', time: '00:00', id: 45, status: false),
    Supplement(name: 'B6-Pyridoxine', time: '00:00', id: 46, status: false),
    Supplement(name: 'B7-Biotin', time: '00:00', id: 47, status: false),
    Supplement(name: 'B9-Folic Acid', time: '00:00', id: 48, status: false),
    Supplement(name: 'B12', time: '00:00', id: 49, status: false),
    Supplement(name: 'D-Glucosamine (Aloe Vera)', time: '00:00', id: 50, status: false),
    Supplement(name: 'Propolis 1500', time: '00:00', id: 51, status: false),
  ];


  Future<void> initializeSupplements() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? storedMeals = preferences.getStringList('Supplement');

    if (storedMeals == null) {
      setMeals();
    } else {
      supplements = storedMeals.map((e) => Supplement.fromJson(json.decode(e))).toList();
      emit(InitializeSupplements());
    }
  }
  static SupplementsCubit get(context) => BlocProvider.of(context);


  late SharedPreferences preferences;


  List<String> listofstring = [];



  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  void setMeals() {
    List<String> mealStrings =
    supplements.map((s) => json.encode(s.toJson())).toList();
    preferences.setStringList('Supplement', mealStrings);
    emit(SetSupplements());
  }

  void updateMealTime(int index, String newTime) {
    supplements[index].time = newTime;
    setMeals();
    emit(UpdateSupplementsTime());
  }


  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = await preferences.getStringList("Supplement");

    if (cominglist == null) {} else {
      supplements = cominglist.map((e) => Supplement.fromJson(json.decode(e))).toList();
      emit(GetSupplementsDataState());
    }
  }

  SetData() {
    listofstring = supplements.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("Supplement", listofstring);

    emit(SetSupplementsDataState());
  }

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    supplements.add(Supplement(name: label , time: dateTime, id: id, status: check));
    emit(SetSupplementsAlarm());
    SetData();
  }

  void updateSupplementStatus(int index, bool newStatus) {
    print('old status ${supplements[index].status}');

    supplements[index].status = newStatus;
    print('new status ${supplements[index].status}');
    setMeals();
    emit(UpdateStatus());
  }

  int generateUniqueId(List<Supplement> meals) {
    Random random = Random();
    int id;

    do {
      id = random.nextInt(100);
    } while (meals.any((meal) => meal.id == id));

    return id;
  }
}
