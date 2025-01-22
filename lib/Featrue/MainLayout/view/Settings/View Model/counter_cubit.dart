import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  static CounterCubit get(context) => BlocProvider.of(context);

  int step = 0;
  int counter = 0;
 late  SharedPreferences preferences;
  Future <void> SetData({required int value})async{
    preferences = await SharedPreferences.getInstance();

    preferences.setInt('targetStep', value);
    step = value;
    emit(SetDataState());

  }
  Future <void> GetData()async{
    preferences = await SharedPreferences.getInstance();
    step = preferences.getInt('targetStep')!;
    emit(GetDataState());
  }
  Future<void> DeleteData()async{
    preferences = await SharedPreferences.getInstance();
    preferences.remove('targetStep');
    step = 0;
    emit(DeleteDataState());
  }
  Future <void> SetCounter({required int value })async{
    int c= await preferences.getInt('counter') ??0;
    preferences = await SharedPreferences.getInstance();

    preferences.setInt('counter', value+c);
    counter = value+c;
    emit(SetDataState());
  }
  Future <void> GetCounter()async{
    preferences = await SharedPreferences.getInstance();
    counter = preferences.getInt('counter')!;
    emit(GetDataState());
  }



}
