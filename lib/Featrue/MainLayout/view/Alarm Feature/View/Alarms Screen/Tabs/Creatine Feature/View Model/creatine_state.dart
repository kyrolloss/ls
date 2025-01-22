part of 'creatine_cubit.dart';

@immutable
sealed class CreatineState {}

final class CreatineInitial extends CreatineState {}

final class SetWakeupTime extends CreatineState {}
final class GetWakeupTime extends CreatineState {}

final class SetSleepTime extends CreatineState {}
final class GetSleepTime extends CreatineState {}
final class InitializeCreatine extends CreatineState {}
final class SetCreatine extends CreatineState {}
final class UpdateCreatineTime extends CreatineState {}
final class GetCreatineDataState extends CreatineState {}
final class SetCreatineDataState extends CreatineState {}
final class SetCreatineAlarm extends CreatineState {}
final class UpdateStatus extends CreatineState {}

final class ChangeAlarmState extends CreatineState {}
final class GetAlarmState extends CreatineState {
final bool state;
GetAlarmState(this.state);
}
