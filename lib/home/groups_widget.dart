import 'package:fleetup/api/group.dart';
import 'package:fleetup/api/meetup_json_source.dart';
import 'package:fleetup/api/meetup_repository.dart';
import 'package:fleetup/communs_widgets/fleetup_button.dart';
import 'package:fleetup/home/my_groups_bloc.dart';
import 'package:fleetup/home/my_groups_event.dart';
import 'package:fleetup/home/my_groups_state.dart';
import 'package:fleetup/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef onSelectedGroup = void Function(String groupId);

class GroupsWidget extends StatelessWidget {
  final Function onSelectedGroup;

  GroupsWidget({this.onSelectedGroup});
  @override
  Widget build(BuildContext context) {
    final myGroupsBloc = MyGroupsBloc(
        meetupRepository: MeetupRepository(MeetupJsonSource(context)));

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Vos groupes', style: Styles.cardTitleText),
              CupertinoButton(
                child: Text(
                  '+ créer un groupe',
                  style: TextStyle(
                    color: CupertinoColors.darkBackgroundGray,
                    fontFamily: 'NotoSans',
                  ),
                ),
              )
            ],
          ),
          Container(
              height: 175,
              child: BlocBuilder<MyGroupsEvent, MyGroupsState>(
                  bloc: myGroupsBloc,
                  builder: (context, state) {
                    if (state is MyGroupsLoaded) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          final group = state.groups[i];
                          return GestureDetector(
                            child: GroupTile(group),
                            onTap: () => onSelectedGroup(),
                          );
                        },
                        itemCount: state.groups.length,
                      );
                    } else {
                      return Container();
                    }
                  })),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 2,
          ),
          FleetupButton(
              onPressed: () => print("TAP"),
              child: Text(
                'Voir tout >',
                style: TextStyle(color: Colors.grey),
              ))
        ],
      ),
    );
  }

  Widget build2(BuildContext context) {
    return Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Vos groupes', style: Styles.cardTitleText),
                CupertinoButton(
                  child: Text('+ créer un groupe'),
                )
              ],
            ),
            PageView.builder(
              itemBuilder: (context, i) {
                return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Container(
                        height: 100,
                        width: 40,
                        child: Image.network(
                            'https://secure.meetupstatic.com/photos/event/6/5/c/6/thumb_475586054.jpeg')));
              },
              itemCount: 5,
            )
          ],
        ));
  }
}

class GroupTile extends StatelessWidget {
  final Group group;

  GroupTile(this.group);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: AspectRatio(
            aspectRatio: 3 / 4.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    alignment: FractionalOffset.topCenter,
                    image: NetworkImage(group.keyPhoto.highresLink)),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1.0)
                        ])),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        group.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSans',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
