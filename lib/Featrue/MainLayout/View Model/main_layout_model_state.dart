part of 'main_layout_model_cubit.dart';

@immutable
sealed class MainLayoutModelState {}

final class MainLayoutModelInitial extends MainLayoutModelState {}


final class ChangePage extends MainLayoutModelState {}
