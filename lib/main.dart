import 'package:fleetup/explorer/explorer_page.dart';
import 'package:fleetup/home/home_page.dart';
import 'package:fleetup/messages/messages_page.dart';
import 'package:fleetup/notifications/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(FleetupApp());
}

class FleetupApp extends StatelessWidget {
  FleetupApp() {
    //MeetupRepository(MeetupApi());
    //MeetupRepository(MeetupJsonSource());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(),
          primaryColor: Color(0xFFF64060),
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          primaryContrastingColor: Color(0xFFF64060),
          barBackgroundColor: CupertinoColors.lightBackgroundGray),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(backgroundColor: Colors.white, items: [
        BottomNavigationBarItem(
            title: Text('Accueil'), icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(
            title: Text('Explorer'), icon: Icon(CupertinoIcons.search)),
        BottomNavigationBarItem(
            title: Text('Notifications'),
            icon: Icon(CupertinoIcons.music_note)),
        BottomNavigationBarItem(
            title: Text('Messages'),
            icon: Icon(CupertinoIcons.conversation_bubble))
      ]),
      resizeToAvoidBottomInset: false,
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return HomePage();
              },
            );
            break;
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return ExplorerPage();
              },
            );
            break;
          case 2:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return NotificationsPage();
              },
            );
            break;
          case 3:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return MessagesPage();
              },
            );
            break;
        }
      },
    );
  }
}
