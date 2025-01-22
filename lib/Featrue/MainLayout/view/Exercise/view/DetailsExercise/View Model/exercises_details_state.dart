part of 'exercises_details_cubit.dart';

@immutable
sealed class ExercisesDetailsState {}

final class ExercisesDetailsInitial extends ExercisesDetailsState {}



final class ExercisesDetailsLoading extends ExercisesDetailsState {}

final class ExercisesDetailsSuccess extends ExercisesDetailsState {}

final class ExercisesDetailsError extends ExercisesDetailsState {}
