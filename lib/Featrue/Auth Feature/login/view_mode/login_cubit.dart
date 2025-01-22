import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/Local_database/cach_helper.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/view/exercise.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:meta/meta.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../model/LoginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static String? token = '';
  static String id = '';
  static String name = '';
  static String email = '';
  static bool isVerified = false;
  static String phone = '';
  static bool isOAuth = false;
  static String role = '';

  static LoginCubit get(context) => BlocProvider.of(context);
  static LoginModel? loginModel;

  Future<void> userLogin(
      {required String mail,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoadingState());
    try {
      final response =
          await DioHelper.PostData(end_point: EndPoints.Login, data: {
        'email': mail,
        'password': password,
            'deviceId': await getDeviceId()
      });
      loginModel = LoginModel.fromJson(response.data);
      print('token from model${loginModel!.token}');
      print('token from response${response.data['token']}');

      await CashHelper.insertToCash(
          key: 'token', value: response.data['token']);
      await CashHelper.insertToCash(
          key: 'email', value: response.data['data']['email']);
      await CashHelper.insertToCash(
          key: 'phone', value: response.data['data']['phone']);
      await CashHelper.insertBoolToCash(
          key: 'isOAuthUser', value: response.data['data']['isOAuthUser']);
      await CashHelper.insertToCash(
          key: 'role', value: response.data['data']['role']);
      await CashHelper.insertToCash(
          key: 'id', value: response.data['data']['_id']);
      await CashHelper.insertBoolToCash(
          key: 'isVerfied', value: response.data['data']['isOAuthUser']);
      await CashHelper.insertToCash(
          key: 'name', value: response.data['data']['username']);

      setUserData();
      print(token);
      emit(LoginSuccessState());
      ExerciseCubit.get(context).getExercise(page: 1);
    } catch (error) {
      print(error.toString());
      emit(LoginErrorState(message: error.toString()));
    }
  }

 static  Future<void> setUserData() async {
    email = await CashHelper.getFromCash(key: 'email');
    id = await CashHelper.getFromCash(key: 'id');
    name = await CashHelper.getFromCash(key: 'name');
    token = await CashHelper.getFromCash(key: 'token');
    isVerified = await CashHelper.getBoolFromCash(key: 'isVerfied');
    print(token);
    isOAuth = await CashHelper.getBoolFromCash(key: 'isOAuthUser');
    role = await CashHelper.getFromCash(key: 'role');

  }


  static Future<String?> getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    } else {
      return null;
    }
  }

}
