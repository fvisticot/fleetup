import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fleetup/api/meetup_repository.dart';
import 'package:meta/meta.dart';

import 'notifications.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final MeetupRepository meetupRepository;
  NotificationsBloc({@required this.meetupRepository}) {
    dispatch(LoadNotificationsEvent());
  }

  @override
  NotificationsState get initialState => NotificationsLoading();

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    final notifications = await meetupRepository.notifications();
    yield NotificationsLoaded(notifications: notifications);
  }
}
