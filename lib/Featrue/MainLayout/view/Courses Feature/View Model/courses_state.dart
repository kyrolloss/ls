part of 'courses_cubit.dart';

@immutable
sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}


final class GetAllCoursesLoading extends CoursesState {}
final class GetAllCoursesSuccess extends CoursesState {}
final class GetAllCoursesFailed extends CoursesState {}

final class GetMyCoursesLoading extends CoursesState {}
final class GetMyCoursesSuccess extends CoursesState {}
final class GetMyCoursesFailed extends CoursesState {}

final class GetSpecificCoursesLoading extends CoursesState {}
final class GetSpecificCoursesSuccess extends CoursesState {}
final class GetSpecificCoursesFailed extends CoursesState {}

final class GetSpecificLessonLoading extends CoursesState {}
final class GetSpecificLessonSuccess extends CoursesState {}
final class GetSpecificLessonFailed extends CoursesState {}

final class CoursesCategoriesSuccess extends CoursesState{}
final class CoursesCategoriesError extends CoursesState{}
final class CoursesCategoriesLoading extends CoursesState{}

final class BuyCourseSuccess extends CoursesState{}
final class BuyCourseError extends CoursesState{}
final class BuyCourseLoading extends CoursesState{}
