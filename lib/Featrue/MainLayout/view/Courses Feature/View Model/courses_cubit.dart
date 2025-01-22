import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Core/DataBase/remote_database/DioHelper.dart';
import 'package:ls/Featrue/MainLayout/view/Courses%20Feature/Model/Courses%20Model/Courses%20Model.dart';
import 'package:ls/Featrue/MainLayout/view/Courses%20Feature/View/Course%20Video%20Screen/Model/Specific%20Model.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/DataBase/remote_database/EndPoints.dart';
import '../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../Model/Buy Course Model/Buy Course Model.dart';
import '../View/Courses View.dart';
import '../View/My Courses/Model/My Courses Model.dart';
import '../View/Specific Course/Model/SpecificCourseLessonModel.dart';
import '../View/Specific Course/View/Specific Course.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());

  static CoursesCubit get(context) => BlocProvider.of(context);

  CoursesCategoriesModel? coursesCategoriesModel;
  MyCourses? myCourses;
  SpecificCourseLessonModel? specificCourseLessonModel;
  SpecificLesson? specificLesson;
  BuyCourseModel? buyCourseModel;

  Future<void> getCoursesCategories() async {
    emit(CoursesCategoriesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.CategoryCourses,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      coursesCategoriesModel = CoursesCategoriesModel.fromJson(response.data);
      emit(CoursesCategoriesSuccess());
    } catch (e) {
      emit(CoursesCategoriesError());
      print(e.toString());
    }
  }

  Future<void> getMyCourses() async {
    emit(GetMyCoursesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: EndPoints.myCourses,
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      myCourses = MyCourses.fromJson(response.data);
      emit(GetMyCoursesSuccess());
    } catch (e) {
      emit(GetMyCoursesFailed());
      print(e.toString());
    }
  }

  Future<void> getSpecificCourse({required String id}) async {
    emit(GetMyCoursesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.courses}/${id}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      myCourses = MyCourses.fromJson(response.data);
      emit(GetMyCoursesSuccess());
    } catch (e) {
      emit(GetMyCoursesFailed());
      print(e.toString());
    }
  }

  Future<void> getSpecificCoursesLesson({required String id}) async {
    specificCourseLessonModel = null;
    emit(GetSpecificCoursesLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.specificCourseLesson}/${id}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      specificCourseLessonModel =
          SpecificCourseLessonModel.fromJson(response.data);

      emit(GetSpecificCoursesSuccess());
    } catch (e) {
      emit(GetSpecificCoursesFailed());
      print(e.toString());
    }
  }

  Future<void> getSpecificLesson({required String id}) async {
    emit(GetSpecificLessonLoading());
    try {
      final response = await DioHelper.get(
          end_ponit: '${EndPoints.lesson}/${id}',
          token: LoginCubit.loginModel?.token ?? LoginCubit.token);

      specificLesson = SpecificLesson.fromJson(response.data);
      emit(GetSpecificLessonSuccess());
    } catch (e) {
      emit(GetSpecificLessonFailed());
      print(e.toString());
    }
  }

  Future<void> buyCourse(
      {required String ID, required BuildContext context}) async {
    emit(BuyCourseLoading());
    try {
      final response = await DioHelper.post(
        end_ponit: '${EndPoints.buyCourse}/$ID',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
      );
      buyCourseModel = BuyCourseModel.fromJson(response.data);

      emit(BuyCourseSuccess());
      if (buyCourseModel?.approvalUrl != null) {
        _startPayment(
            url: buyCourseModel!.approvalUrl, context: context, ID: ID);
      }
    } catch (e) {
      emit(BuyCourseError());
      print(e.toString());
    }
  }

  void _startPayment(
      {required String url,
      required BuildContext context,
      required String ID}) async {
    await launchUrl(Uri.parse(url));
  }

  Future<void> CapturePayment({required String token}) async {
    emit(BuyCourseLoading());
    try {
      await DioHelper.post(
        end_ponit: '${EndPoints.capturePayment}',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        query: {
          'token': token,
        },
      );
      emit(BuyCourseSuccess());
      await getCoursesCategories();
    } catch (e) {
      emit(BuyCourseError());
      print(e.toString());
    }
  }

  Future<void> CapturePaymentForLessonScreen(
      {required String token,
      required String Id,
      required bool isEnrolled}) async {
    emit(BuyCourseLoading());
    try {
      await DioHelper.post(
        end_ponit: '${EndPoints.capturePayment}',
        token: LoginCubit.loginModel?.token ?? LoginCubit.token,
        query: {
          'token': token,
        },
      );
      isEnrolled = true;
      emit(BuyCourseSuccess());
      await getSpecificCoursesLesson(id: Id);
      await getCoursesCategories();

    } catch (e) {
      emit(BuyCourseError());
      print(e.toString());
    }
  }
}
