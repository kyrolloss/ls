
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  static OtpCubit get(context) => BlocProvider.of(context);

  Future<void> verifyOTP({required String otp }) async {
    emit(VerifyEmailLoading());
    try {
      final response = await DioHelper.post(
        end_ponit: EndPoints.SendOTP,
        data: {'resetCode': otp}

      );
        emit(VerifyEmailSuccess(message: 'Email verified successfully'));

    } catch (e) {
      print(e.toString());
      emit(VerifyEmailError(message: e.toString()));
    }
  }
}
