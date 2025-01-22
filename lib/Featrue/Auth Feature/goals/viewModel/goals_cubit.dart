
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit() : super(GoalsInitial());

  static GoalsCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  String selectedGender = 'male';
  int selectedAge = 20;
  int? selectedLength;
  String? selectedLengthUnit;
  int? selectedWeight;
  String? selectedWeightUnit = 'kg';
  String? selectedTargetWeightUnit ='Kg';

  int? selectedTargetweight;

  Future<void> MyGoals({
    required String weight,
    required String Targetweight,
    required int age,
    required String length,
    required String gender,
  }) async {
    emit(MyGoalsLoading());

    print(selectedLength);
    print(selectedLengthUnit);
    print(selectedWeight);
    print(selectedWeightUnit);
    print(selectedTargetweight);
    print(selectedGender);

    print("Token being used: ${loginModel?.token ?? LoginCubit.token}");

    try {
      final response = await DioHelper.PostData(
        // end_ponit: EndPoints.MyGoals,
        end_point: EndPoints.MyGoals,
        token: loginModel?.token ?? LoginCubit.token,
        data: {
          'gender': selectedGender,
          'age': selectedAge.toString(),
          'length': '$selectedLength $selectedLengthUnit',
          'weight': '$selectedWeight $selectedWeightUnit',
          'targetWeight': '$selectedTargetweight $selectedTargetWeightUnit',
        },
      );

      emit(MyGoalsSuccess());
    } catch (e) {
      emit(MyGoalsError());
      print(e.toString());
    }
  }

  void setLength(int length, String unit) {
    selectedLength = length;
    selectedLengthUnit = unit;
  }

  void setGender(String gender) {
    selectedGender = gender;
  }

  void setAge(int Age) {
    selectedAge = Age;
  }

  void setWeigth(int weight, {bool? isKg}) {
    if (isKg != null && isKg) {
      selectedWeight = weight;
    } else {
      selectedWeight = weight;
    }
  }


  void setTargetWeigth(int Targetweigth,{bool? isKg}) {
    // selectedTargetweight = Targetweigth;
    if (isKg != null && isKg){
      selectedTargetweight = Targetweigth;
    } else {
      selectedTargetweight = Targetweigth;
    }

  }
}
