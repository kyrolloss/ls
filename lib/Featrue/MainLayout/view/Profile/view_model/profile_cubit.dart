
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

import '../model/ProfileModel.dart';
import 'package:device_info_plus/device_info_plus.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static String name = '';

  static ProfileCubit get(context) =>BlocProvider.of(context);
  ProfileModel? profileModel;




  Future<void> myProfile() async {
    emit(getProfileLoading());
    try{
      final response = await DioHelper.get(
          end_ponit:EndPoints.Profile,
        token:LoginCubit.loginModel?.token ?? LoginCubit.token
      );
      profileModel = ProfileModel.fromJson(response.data);
      emit(getProfileSuccess());
    }
    catch (e){
      print(e.toString());
      emit(getProfileError(message: e.toString()));
    }
  }









}
