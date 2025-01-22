part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class getProfileSuccess extends ProfileState{}
class getProfileLoading extends ProfileState{}
class getProfileError extends ProfileState{
  final String message;
  getProfileError({required this.message});
}


