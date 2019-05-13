import 'package:fleetup/communs_widgets/fleetup_button.dart';
import 'package:fleetup/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef onSelectedGroup = void Function(String groupId);

class GroupsWidget extends StatelessWidget {
  final Function onSelectedGroup;

  GroupsWidget({this.onSelectedGroup});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Vos groupes', style: Styles.headlineName),
              CupertinoButton(
                child: Text('+ créer un groupe'),
              )
            ],
          ),
          Container(
            height: 175,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () => onSelectedGroup('aaa'),
                    highlightColor: Colors.grey,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: AspectRatio(
                          aspectRatio: 3 / 4.5,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  alignment: FractionalOffset.topCenter,
                                  image: new NetworkImage(
                                      'https://secure.meetupstatic.com/photos/event/6/5/c/6/600_475586054.jpeg')),
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
                                        Colors.black.withOpacity(0.05),
                                        Colors.black.withOpacity(0.25)
                                      ])),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "fqdsf",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
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
                Text('Vos groupes', style: Styles.headlineText),
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
