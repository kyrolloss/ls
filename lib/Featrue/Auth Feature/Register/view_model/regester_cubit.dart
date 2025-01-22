
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/Local_database/cach_helper.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

import '../model/Register_model.dart';

part 'regester_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);


  Future<void> userRegister({
    required  String username,
    required  String email,
    required  String phone,
    required  String password,
    required  String confirmPassword,
}) async{
     emit(RegisterLoadingState());
     try{
       final response = await DioHelper.PostData(
         end_point: EndPoints.Register,
         data: {
             'username' : username,
             'email' : email,
             'phone' : phone,
             'password' : password,
             'confirmPassword' : confirmPassword,
           'deviceId': await LoginCubit.getDeviceId()

         }
       );

       LoginCubit.loginModel = LoginModel.fromJson(response.data);
       print(response.data);


       await CashHelper.insertToCash(key: 'token', value: response.data['token']);
       await CashHelper.insertToCash(key: 'email', value: response.data['data']['email']);
       await CashHelper.insertToCash(key: 'id', value: response.data['data']['_id']);
       await CashHelper.insertToCash(key: 'phone', value: phone);
       await CashHelper.insertBoolToCash(key:'isVerified', value: response.data['data']['isOAuthUser']);
       await CashHelper.insertToCash(key: 'name', value: response.data['data']['username'] );

       LoginCubit.email = await CashHelper.getFromCash(key: 'email');
       LoginCubit.id = await CashHelper.getFromCash(key: 'id');
       LoginCubit.name = await CashHelper.getFromCash(key: 'name');
       LoginCubit.token = await CashHelper.getFromCash(key: 'token');
       LoginCubit.isVerified =
       await CashHelper.getBoolFromCash(key: 'isVerfied');

       emit(RegisterSuccessState());

     }
         catch(e){
       emit(RegisterErrorState(message: ''));
          print(e.toString());

         }
}

}
