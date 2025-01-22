part of 'workout_cubit.dart';

@immutable
sealed class WorkoutState {}

final class WorkoutInitial extends WorkoutState {}

final class SupplementsInitial extends WorkoutState {}

final class SetWorkout extends WorkoutState {}
final class UpdateStatus extends WorkoutState {}

final class UpdateWorkoutTime extends WorkoutState {}

final class GetWorkoutDataState extends WorkoutState {}

final class SetWorkoutDataState extends WorkoutState {}

final class SetWorkoutAlarm extends WorkoutState {}

final class InitializeWorkout extends WorkoutState {}
