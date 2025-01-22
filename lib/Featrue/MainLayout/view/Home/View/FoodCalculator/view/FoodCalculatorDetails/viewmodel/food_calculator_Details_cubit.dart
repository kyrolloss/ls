import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/Auth%20Feature/login/model/LoginModel.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';

import '../Model/FoodCalculatorDetailsModel.dart';

part 'food_calculator_Details_state.dart';

class FoodCalculatorDetailsCubit extends Cubit<FoodCalculatorDetailsState> {
  FoodCalculatorDetailsCubit() : super(FoodCalculatorInitial());

  static FoodCalculatorDetailsCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  FoodCalculatorDetailsModel? foodCalculatorDetails;

  Future<void> fetchFoodCalculatorDetails({
    required String mealId,
    required String quantities,
  }) async {
    emit(FoodCalculatorDetailsLoading());
    try {
      final response = await DioHelper.PostData(
        end_point: EndPoints.FoodCalculatorDetails,
        token: loginModel?.token ?? LoginCubit.token,
        data: {
          'mealId': mealId,
          'quantities': quantities,
        },
      );

      foodCalculatorDetails = FoodCalculatorDetailsModel.fromJson(response.data);
      print(response.data);
      emit(FoodCalculatorDetailsSuccess(foodDetails: foodCalculatorDetails!));
    } catch (e) {
      print(e.toString());
      emit(FoodCalculatorDetailsError());
    }
  }
}
