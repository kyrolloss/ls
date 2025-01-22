part of 'sleep_cubit.dart';

@immutable
sealed class SleepState {}

final class SleepInitial extends SleepState {}

final class SetSleep extends SleepState {}

final class SleepTime extends SleepState {}
final class UpdateSleepTime extends SleepState {}

final class GetSleepDataState extends SleepState {}

final class SetSleepDataState extends SleepState {}

final class SetSleepAlarm extends SleepState {}

final class InitializeSleep extends SleepState {}
final class UpdateStatus extends SleepState {}
