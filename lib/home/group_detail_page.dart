import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //navigationBar: CupertinoNavigationBar(middle: Text("fqsdf")),
      child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text('Refresh'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(CupertinoIcons.share),
                  Icon(CupertinoIcons.ellipsis)
                ],
              ),
            ),
            CupertinoSliverRefreshControl(
              onRefresh: () {
                return Future<void>.delayed(const Duration(seconds: 2))
                  ..then<void>((_) {
                    ;
                  });
              },
            ),
            SliverSafeArea(
                top: false, // Top safe area is consumed by the navigation bar.
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    switch (index) {
                      case 0:
                        return GroupHead();
                        break;
                      case 1:
                        return MembersAvatarsList();
                        break;
                      case 2:
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CupertinoButton.filled(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              child: Text('Créer un événement'),
                              onPressed: () => print('')),
                        );
                    }
                  },
                  childCount: 3,
                )))
          ]),
    );
  }
}

class GroupHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image.network(
              'https://secure.meetupstatic.com/photos/event/6/5/c/6/600_475586054.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton.filled(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.photo_camera_solid,
                          size: 40,
                          color: Colors.black,
                        ),
                        Text('Modifier')
                      ],
                    ),
                    onPressed: () {
                      print('pressed');
                    })),
          )
        ],
      ),
    );
  }
}

class MembersAvatarsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => print('Pressed'),
      child: Container(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://secure.meetupstatic.com/photos/member/d/5/7/2/member_96294642.jpeg'),
                ),
              );
            }),
      ),
    );
  }
}
