part of 'new_password_cubit.dart';

@immutable
abstract class NewPasswordState {}

class NewPasswordInitial extends NewPasswordState {}

class NewPasswordSuccess extends NewPasswordState{
  final String message;

  NewPasswordSuccess({required this.message});
}
class NewPasswordLoading extends NewPasswordState{}
class NewPasswordError  extends NewPasswordState{
  final String message;

   NewPasswordError ({required this.message});
}


