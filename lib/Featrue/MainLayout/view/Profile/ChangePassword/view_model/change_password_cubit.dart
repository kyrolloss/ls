
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context) =>BlocProvider.of(context);
  LoginModel? loginModel;


  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword
}) async {
    emit(ChangePasswordLoading());
    try{
      final response = await DioHelper.putChangePassword(
          end_ponit: EndPoints.ChangePassword,
          token: loginModel?.token ?? LoginCubit.token,
          data: {
        'currentPassword': currentPassword,
         'newPassword': newPassword,
            'confirmPassword': confirmPassword
      },
      );
      emit(ChangePasswordSuccess());
    }
    catch(e){
     emit(ChangePasswordError());
     print(e.toString());
    }

}
}
