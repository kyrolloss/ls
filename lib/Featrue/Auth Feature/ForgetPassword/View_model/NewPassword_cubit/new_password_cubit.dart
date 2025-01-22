

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());

  static NewPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> Newpassword({
    required String email,
    required String newPassword,
    required String confirmNewPassword,}) async{
    emit(NewPasswordLoading());
    try{
      final response = await DioHelper.post(
          end_ponit: EndPoints.NewPassword,
        data : {
            "email":email,
            "newPassword": newPassword,
            "newPasswordConfirm": confirmNewPassword ,
        }
      );
      emit(NewPasswordSuccess(message:response.data['message']));
    }catch(error){
      print(error.toString());
      emit(NewPasswordError(message: error.toString()));
    }

  }




 }
