part of 'goals_cubit.dart';



@immutable
abstract class GoalsState {}

class GoalsInitial extends GoalsState {}

class MyGoalsSuccess extends GoalsState{}
class MyGoalsError extends GoalsState{}
class MyGoalsLoading extends GoalsState{}
