part of 'progress_cubit.dart';

@immutable
sealed class ProgressState {}

final class ProgressInitial extends ProgressState {}

final class GetProgressLoading extends ProgressState {}
final class GetProgressSuccess extends ProgressState {}
final class GetProgressError extends ProgressState {}

final class AddProgressLoading extends ProgressState {}
final class AddProgressSuccess extends ProgressState {}
final class AddProgressError extends ProgressState {}

final class ListOfChartsDone extends ProgressState {}
final class ListOfChartsDeleteDone extends ProgressState {}


