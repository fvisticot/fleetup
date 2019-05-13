import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'group_detail_page.dart';
import 'groups_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.only(bottom: 4),
        backgroundColor: Colors.white,
        middle: Image.asset('assets/logo.png'),
        trailing: GestureDetector(
            onTap: () {
              print('tap');
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0, right: 12),
              child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://secure.meetupstatic.com/photos/member/d/5/7/2/member_96294642.jpeg')),
            )),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            color: CupertinoTheme.of(context).barBackgroundColor,
            child: ListView(
              children: <Widget>[
                Card(
                    elevation: 0,
                    child: GroupsWidget(onSelectedGroup: (groupId) {
                      Navigator.of(context).push(CupertinoPageRoute(
                          fullscreenDialog: false,
                          builder: (context) => GroupDetailPage()));
                    }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
