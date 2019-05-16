import 'package:fleetup/api/group.dart';
import 'package:fleetup/api/meetup_api.dart';
import 'package:fleetup/api/notification.dart';
import 'package:fleetup/api/topic_category.dart';
import 'package:flutter/cupertino.dart';

class MeetupJsonSource implements MeetupApi {
  BuildContext context;

  MeetupJsonSource(this.context);

  Future<String> _loadJsonFile(String file) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/$file');
  }

  Future<List<Group>> myGroups() async {
    final jsonStr = await _loadJsonFile('my_groups.json');
    List<Group> groups = groupsFromJson(jsonStr);
    return groups;
  }

  Future<List<TopicCategory>> topicCategories() async {
    final jsonStr = await _loadJsonFile('topic_categories.json');
    List<TopicCategory> topicCategories = topicCategoriesFromJson(jsonStr);
    return topicCategories;
  }

  Future<List<MeetupNotification>> notifications() async {
    final jsonStr = await _loadJsonFile('notifications.json');
    List<MeetupNotification> notifications = notificationsFromJson(jsonStr);
    return notifications;
  }
}
