import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/view/DetailsExercise/Model/Exercise%20Details%20Model/Exercise%20Details%20Model.dart';
import 'package:meta/meta.dart';

import '../../../../../../../Core/DataBase/remote_database/DioHelper.dart';
import '../../../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../view/DetailsExercise.dart';

part 'exercises_details_state.dart';

class ExercisesDetailsCubit extends Cubit<ExercisesDetailsState> {
  ExercisesDetailsCubit() : super(ExercisesDetailsInitial());

  ExerciseDetailsModel? exerciseDetailsModel;

  static ExercisesDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> getExercisesDetails(
      {required String id,
      required bool isAdvertise,
      required BuildContext context}) async {
    emit(ExercisesDetailsLoading());
    try {
      final response = await DioHelper.get(
        end_ponit: '${EndPoints.GetExercise}/$id',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );
      exerciseDetailsModel = ExerciseDetailsModel.fromJson(response.data);
      print('=============================');
      print(exerciseDetailsModel);

      emit(ExercisesDetailsSuccess());
    } catch (e) {
      print(e.toString());
      emit(ExercisesDetailsError());
    }
  }
}
