import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: Icon(CupertinoIcons.search),
        ),
        child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, i) {
              return Divider(
                height: 1,
              );
            },
            itemBuilder: (context, i) {
              return MemberListTile();
            }));
  }
}

class MemberListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => print("ontap"),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 70,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://secure.meetupstatic.com/photos/member/d/5/7/2/member_96294642.jpeg'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Brice',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Vous êtes tous les deux membres de BordeauxJS & 2 autres groupes',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            Icon(CupertinoIcons.person_solid)
          ],
        ),
      ),
    );
  }
}
