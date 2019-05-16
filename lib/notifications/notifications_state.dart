import 'package:equatable/equatable.dart';
import 'package:fleetup/api/notification.dart';
import 'package:meta/meta.dart';

abstract class NotificationsState extends Equatable {
  NotificationsState([List props = const []]) : super(props);
}

class NotificationsLoading extends NotificationsState {
  @override
  String toString() => 'NotificationsLoading';
}

class NotificationsLoaded extends NotificationsState {
  final List<MeetupNotification> notifications;

  NotificationsLoaded({this.notifications = const []}) : super([notifications]);

  @override
  String toString() {
    return 'NotificationsSuccess{groups: $notifications}';
  }
}

class NotificationsFailure extends NotificationsState {
  final String error;

  NotificationsFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'NotificationsFailure { error: $error }';
}
