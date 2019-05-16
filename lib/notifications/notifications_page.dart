import 'package:fleetup/api/meetup_json_source.dart';
import 'package:fleetup/api/meetup_repository.dart';
import 'package:fleetup/api/notification.dart';
import 'package:fleetup/notifications/notifications_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html2md/html2md.dart' as html2md;

import 'notifications.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsBloc _notificationsBloc;

  NotificationsPage();

  @override
  Widget build(BuildContext context) {
    _notificationsBloc = NotificationsBloc(
        meetupRepository: MeetupRepository(MeetupJsonSource(context)));
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          middle: Text('Notifications'),
        ),
        child: BlocBuilder(
            bloc: _notificationsBloc,
            builder: (context, state) {
              if (state is NotificationsLoaded) {
                return ListView.separated(
                    itemCount: state.notifications.length,
                    separatorBuilder: (context, i) {
                      return Divider(
                        height: 1,
                      );
                    },
                    itemBuilder: (context, i) {
                      MeetupNotification notification = state.notifications[i];
                      return NotificationListTile(notification);
                    });
              } else {
                return Container();
              }
            }));
  }
}

class NotificationListTile extends StatelessWidget {
  final MeetupNotification notification;

  NotificationListTile(this.notification);

  @override
  Widget build(BuildContext context) {
    var leadingWidget;
    String markdown = html2md.convert(notification.text);

    if (notification.photoType == PhotoTypeEnum.MEMBER) {
      if (notification.photo != null) {
        leadingWidget = CircleAvatar(
          backgroundImage: NetworkImage(notification.photo.highresLink),
        );
      } else {
        leadingWidget = CircleAvatar(
          backgroundColor: CupertinoColors.lightBackgroundGray,
        );
      }
    } else if (notification.photoType == PhotoTypeEnum.EVENT) {
      leadingWidget = Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: FractionalOffset.topCenter,
                image: NetworkImage(notification.photo.highresLink)),
          ));
    }

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 80,
        child: Row(
          children: <Widget>[
            if (leadingWidget != null) leadingWidget,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Markdown(data: markdown),
                  Text(
                    'il y a 23 heures',
                    style: TextStyle(color: Colors.grey, fontSize: 9),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
