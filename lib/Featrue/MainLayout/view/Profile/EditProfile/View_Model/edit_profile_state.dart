part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileSuccess extends EditProfileState{}
class EditProfileLoading extends EditProfileState{}
class EditProfileError extends EditProfileState{}

class ChangeImageSuccess extends EditProfileState{}
class ChangeImageLoading extends EditProfileState{}
class ChangeImageError extends EditProfileState{}
