part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
final class SetDataState extends CounterState {}
final class GetDataState extends CounterState {}
final class DeleteDataState extends CounterState {}


