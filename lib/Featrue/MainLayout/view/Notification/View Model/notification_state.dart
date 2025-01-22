part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}
class NotificationConnected extends NotificationState {}


class RequestPermissionState extends NotificationState {}

class ShowNotificationState extends NotificationState {}
class MarkNotificationAsReadLoading extends NotificationState {}
class MarkNotificationAsReadSuccess extends NotificationState {}
class MarkNotificationAsReadError extends NotificationState {}

class NotificationError extends NotificationState {
  final String error;

  NotificationError(this.error);
}

class NotificationReceived extends NotificationState {
  final String data;

  NotificationReceived(this.data);
}

class GetAllNotificationLoading extends NotificationState {}
class GetAllNotificationSuccess extends NotificationState {}
class GetAllNotificationError extends NotificationState {}

