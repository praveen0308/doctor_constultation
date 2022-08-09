part of 'user_notifications_cubit.dart';

@immutable
abstract class UserNotificationsState {}

class UserNotificationsInitial extends UserNotificationsState {}
class LoadingNotifications extends UserNotificationsState {}
class NoNotifications extends UserNotificationsState {}
class Error extends UserNotificationsState {
  final String error;

  Error(this.error);
}
class ReceivedUserNotifications extends UserNotificationsState {
  final List<NotificationModel> notifications;

  ReceivedUserNotifications(this.notifications);
}
