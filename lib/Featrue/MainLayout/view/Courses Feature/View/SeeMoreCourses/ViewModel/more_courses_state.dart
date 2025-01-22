part of 'more_courses_cubit.dart';

@immutable
abstract class MoreCoursesState {}

class MoreCoursesInitial extends MoreCoursesState {}

class SeeMoreCoursesSuccess extends MoreCoursesState{}
class SeeMoreCoursesError extends MoreCoursesState{}
class SeeMoreCoursesLoading extends MoreCoursesState{}
