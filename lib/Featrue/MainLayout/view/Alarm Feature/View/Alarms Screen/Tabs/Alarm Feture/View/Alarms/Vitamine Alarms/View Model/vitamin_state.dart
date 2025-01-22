part of 'vitamin_cubit.dart';

@immutable
sealed class VitaminState {}

final class VitaminInitial extends VitaminState {}


final class SetVitamin extends     VitaminState {}

final class UpdateTime extends   VitaminState {}

final class GetDataState extends VitaminState {}
final class SetDataState extends VitaminState {}


final class SetAlarm extends     VitaminState {}
final class InitializeVitamin extends VitaminState {}
final class UpdateStatus extends VitaminState {}







