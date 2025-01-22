part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class VerifyEmailSuccess extends OtpState {
  final   String message;

  VerifyEmailSuccess({required this.message});

}
class VerifyEmailLoading extends OtpState {}
class VerifyEmailError extends  OtpState {
  final   String message;

  VerifyEmailError({required this.message});
}
