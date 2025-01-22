part of 'alarm_cubit.dart';

@immutable
sealed class AlarmState {}

final class AlarmInitial extends AlarmState {}


final class SetMeals extends     AlarmState {}

final class UpdateTime extends   AlarmState {}
final class UpdateStatus extends   AlarmState {}

final class GetDataState extends AlarmState {}

final class SetDataState extends AlarmState {}


final class SetAlarm extends     AlarmState {}
final class InitializeMeals extends AlarmState {}







