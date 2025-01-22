
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:meta/meta.dart';
import 'package:number_paginator/number_paginator.dart';
import '../Model/FoodCalculatorModel.dart';

part 'food_calculator_state.dart';

class FoodCalculatorCubit extends Cubit<FoodCalculatorState> {
  FoodCalculatorCubit() : super(FoodCalculatorInitial());
  static FoodCalculatorCubit get(context) => BlocProvider.of(context);

  FoodCalculatorModel? foodCalculatorModel;
  int currentPage = 1;



  Future<void> getFoodCalculator({String? mealCategory,int page=1}) async {
    emit(FoodCalculatorLoading());
    try {
      final String endpoint = mealCategory != null && mealCategory.isNotEmpty
          ? '${EndPoints.FoodCalculator}?mealCategory=$mealCategory'
          : EndPoints.FoodCalculator;
      final response = await DioHelper.get(end_ponit: endpoint,
        query: {
        'page' :page
        },
        token:LoginCubit.loginModel?.token ?? LoginCubit.token,
      );
      foodCalculatorModel = FoodCalculatorModel.fromJson(response.data);
      emit(FoodCalculatorSuccess(foodCalculatorModel!));
    } catch (e) {
      print(e.toString());
      emit(FoodCalculatorError());
    }
  }





  // دالة searchFoodCalculator لإجراء عملية البحث
  Future<void> searchFoodCalculator({required String query}) async {
    emit(FoodCalculatorLoading());

    try {
      final String endpoint = '${EndPoints.FoodCalculator}?keyword=$query';

      final response = await DioHelper.get(end_ponit: endpoint,
        token:LoginCubit.loginModel?.token ?? LoginCubit.token,

      );

      foodCalculatorModel = FoodCalculatorModel.fromJson(response.data);
      emit(FoodCalculatorSuccess(foodCalculatorModel!));
    } catch (e) {
      print(e.toString());
      emit(FoodCalculatorError());
    }
  }

  void changePage(
      {required NumberPaginatorController controller, required int index}) {
    if (controller.currentPage != index) {
      controller.navigateToPage(index);
    }
    emit(ChangePageFoodState());
  }


}