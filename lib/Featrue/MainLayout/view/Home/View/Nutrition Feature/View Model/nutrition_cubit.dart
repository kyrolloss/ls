import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/Nutrition%20Feature/Model/Nuturition%20Model.dart';
import 'package:meta/meta.dart';

import '../../../../../../Auth Feature/login/view_mode/login_cubit.dart';

part 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  NutritionCubit() : super(NutritionInitial());

  static NutritionCubit get(context) => BlocProvider.of(context);
  NutritionModel? nutritionItems;
  int calories = 0;

  Future<void> getImageNutrition({required XFile image}) async {
    emit(GetImageNutritionLoading());
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path),
      });
      final response = await DioHelper.post(
        end_ponit: EndPoints.nutrition,
        formData: formData,
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );

      nutritionItems = NutritionModel.fromJson(response.data);
      calories = nutritionItems?.data![0].nutritionData![2].value.toInt() ?? 0;
      print(calories);



      emit(GetImageNutritionSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetImageNutritionError());
    }
  }


  XFile? _imageFile;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    _imageFile = image;

    await getImageNutrition(image: _imageFile!);
    emit(GetImageFromGalleryLoading());
  }
}
