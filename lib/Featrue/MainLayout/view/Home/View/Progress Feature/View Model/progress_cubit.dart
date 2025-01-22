import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../Core/DataBase/remote_database/DioHelper.dart';
import '../../../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/PrgoressModel.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit() : super(ProgressInitial());

  static ProgressCubit get(context) => BlocProvider.of(context);

  String? selectedValue;
  ProgressModel? progressModel;
  List<FlSpot> spots = [];

  Future<void> getExercisesProgress({required String id}) async {
    emit(GetProgressLoading());
    try {
      final response = await DioHelper.get(
        end_ponit: '${EndPoints.Progress}/$id',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );
      progressModel = ProgressModel.fromJson(response.data);
      emit(GetProgressSuccess());
    } catch (e) {
      print(e);
      emit(GetProgressError());
    }
  }

  Future<void> addProgress({required double Volume, required String id}) async {
    progressModel = null;

    emit(AddProgressLoading());
    try {
    await DioHelper.post(
          end_ponit: EndPoints.Progress,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,
          data: {"volume": Volume, 'exerciseId': id});
      emit(AddProgressSuccess());
     await getExercisesProgress(id: id);
     spots.clear();
    generateSpots(progressModel!);
    } catch (e) {
      print(e);
      emit(AddProgressError());
    }
  }

void clearSpots(){
  spots.clear();
  print('spots is $spots');
  emit(ListOfChartsDeleteDone());
}

  void generateSpots(ProgressModel progressModel) {
    print('generateSpots');
    clearSpots();

    if (progressModel.data!.isEmpty) {
      print("The volumes list is empty, no spots generated.");
      return;
    }
    else{
      print('spots');
      // int firstVolume = volumes.first.volume - 10;
      // spots.add(FlSpot(0, firstVolume.toDouble()));
      //
      // int lastVolume = volumes.last.volume + 10;
      // spots.add(FlSpot(volumes.length * 10.0, lastVolume.toDouble()));

      for (int i = 0; i < progressModel.data!.first.volumes.length; i++) {
        print(i);
        spots.add(FlSpot(i*10, progressModel.data!.first.volumes[i].volume.toDouble()));
      }

      print(spots);

      print('spots done');
      emit(ListOfChartsDone());
    }


  }
}
