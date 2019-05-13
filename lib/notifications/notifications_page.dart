import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          middle: Text('Notifications'),
        ),
        child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, i) {
              return Divider(
                height: 1,
              );
            },
            itemBuilder: (context, i) {
              return NotificationListTile();
            }));
  }
}

class NotificationListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 80,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://secure.meetupstatic.com/photos/member/d/5/7/2/member_96294642.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Fred a aimé ce message'),
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
