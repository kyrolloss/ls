import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:meta/meta.dart';

import '../../../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/MoreCoursesModel.dart';
part 'more_courses_state.dart';

class MoreCoursesCubit extends Cubit<MoreCoursesState> {
  MoreCoursesCubit() : super(MoreCoursesInitial());

  static MoreCoursesCubit get(context)=> BlocProvider.of(context);

  SeeMoreCoursesModel? seeMoreCourses;


  Future<void> SeeMoreCourses({required String ID})async{
    emit(SeeMoreCoursesLoading());
    try{
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.CategoryCourses}/$ID/${EndPoints.courses}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token,);
      seeMoreCourses = SeeMoreCoursesModel.fromJson(response.data);
      emit(SeeMoreCoursesSuccess());

    }catch(e){
      print(e.toString());
      emit(SeeMoreCoursesError());
    }

  }







}
