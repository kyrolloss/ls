import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/Auth%20Feature/login/view_mode/login_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculatorFilter/Model/FoodCalculatorFilter.dart';
import 'package:meta/meta.dart';
part 'food_calculator_filter_state.dart';

class FoodCalculatorFilterCubit extends Cubit<FoodCalculatorFilterState> {
  FoodCalculatorFilterCubit() : super(FoodCalculatorFilterInitial());

  static FoodCalculatorFilterCubit get(context) =>BlocProvider.of(context);
  FoodCalculatorFilterModel? foodCalculatorFilterModel;

  Future<void> FoodCalculatorCategory()async{
    emit(FoodCalculatorFilterLoading());
    try{
      final response = await DioHelper.get(
          end_ponit: EndPoints.FoodCalculatorFilter,

        token: LoginCubit.loginModel?.token ?? LoginCubit.token
      );
      foodCalculatorFilterModel = FoodCalculatorFilterModel.fromJson(response.data);
      emit(FoodCalculatorFilterSuccess());
    }catch(e){
      emit(FoodCalculatorFilterError());
      print(e.toString());
    }
  }

}
