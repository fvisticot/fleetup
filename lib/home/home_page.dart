import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong/latlong.dart' as latlong;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Votre prochain événénement',
              style: Styles.cardTitleText,
            ),
            Container(
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: AdaptativeMap(),
              ),
            ),
            Text('Flutter & Dart Bordeaux'),
            Text('Fleetup - Les écrans de Meetup avec Flutter'),
            Text('demain 19:00 Bordeaux Ynov Campus'),
            Row(
              children: <Widget>[Text("J'y vais avec 27 personnes")],
            )
          ],
        ));
  }
}

class AdaptativeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return FlutterMap(
          options: MapOptions(
            center: latlong.LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
              urlTemplate: "https://api.tiles.mapbox.com/v4/"
                  "{id}/{z}/{x}/{y}@2x.png?access_token={$kMapboxAccessToken}",
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
