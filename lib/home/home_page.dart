import 'package:fleetup/communs_widgets/fleetup_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong/latlong.dart' as latlong;
import 'package:url_launcher/url_launcher.dart';

import '../styles.dart';
import 'group_detail_page.dart';
import 'groups_widget.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;
const kMapboxAccessToken =
    'pk.eyJ1IjoidGljYXRhZyIsImEiOiJjam9ldnJ2dm0wNHllM3ZxcWFybmRiOHQ4In0.n0WvxJI-K2wh2ftfKIJ9jw';

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
                    })),
                NextEventWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NextEventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Votre prochain événénement',
                style: Styles.cardTitleText,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _launchItinerary(LatLng(3.4, 4.7)),
                      child: Container(
                        height: 130,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          child: AdaptativeMap(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Icon(
                            CupertinoIcons.share,
                            color: CupertinoColors.white,
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(100, 0, 0, 0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Flutter & Dart Bordeaux',
                style: Styles.nextEventTitleText,
              ),
              Text('Fleetup - Les écrans de Meetup avec Flutter',
                  style: Styles.nextEventDescText),
              Text('demain 19:00 Bordeaux Ynov Campus',
                  style: Styles.nextEventInfoText),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildAvatars(),
                  Text("J'y vais avec 27 personnes",
                      style: Styles.nextEventInfoText)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                color: CupertinoColors.lightBackgroundGray,
              ),
              FleetupButton(
                  onPressed: () => print("TAP"),
                  child: Text(
                    'Commentaires (3)',
                    style: Styles.nextEventInfoText,
                  ))
            ],
          ),
        ));
  }

  _buildAvatars() {
    return Container(
      width: 90,
      height: 28,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.green,
              radius: 14,
              child: Text(
                'V',
                style: TextStyle(color: Colors.white),
              )),
          CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(
                  'https://secure.meetupstatic.com/photos/member/d/5/7/2/member_96294642.jpeg')),
          CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(
                  'https://secure.meetupstatic.com/photos/member/d/5/7/2/member_96294642.jpeg')),
        ],
      ),
    );
  }

  _launchItinerary(LatLng location) async {
    String googleUrl =
        'comgooglemaps://?daddr=${location.latitude},${location.longitude}';
    String appleUrl =
        'https://maps.apple.com/?daddr=${location.latitude},${location.longitude}';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }
}

class AdaptativeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return FlutterMap(
          options: MapOptions(
            interactive: false,
            center: latlong.LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
              urlTemplate: "https://api.tiles.mapbox.com/v4/"
                  "{id}/{z}/{x}/{y}@2x.png?access_token=$kMapboxAccessToken",
              additionalOptions: {
                'accessToken': '$kMapboxAccessToken',
                'id': 'mapbox.streets',
              },
            )
          ]);
    } else {
      return GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.4746,
          ));
    }
  }
}
