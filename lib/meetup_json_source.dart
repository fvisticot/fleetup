import 'package:fleetup/meetup_api.dart';
import 'package:flutter/cupertino.dart';

class MeetupJsonSource implements MeetupApi {
  BuildContext context;

  MeetupJsonSource(this.context);

  Future<String> _loadJsonFile(String file) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/country.json');
  }
}
