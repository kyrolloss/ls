
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    try{
      await DioHelper.postForgetPassword(
          end_ponit: EndPoints.ForgetPassword,
        data: {
            'email' : email});
      emit(ForgetPasswordSuccess());
    }catch(e) {
      emit(ForgetPasswordError());
    }

  }
}
