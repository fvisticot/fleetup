import 'package:fleetup/api/group.dart';
import 'package:fleetup/api/meetup_api.dart';
import 'package:fleetup/api/notification.dart';
import 'package:fleetup/api/topic_category.dart';

class MeetupRepository {
  final MeetupApi meetupApi;

  MeetupRepository(this.meetupApi);

  Future<List<Group>> myGroups() async {
    return meetupApi.myGroups();
  }

  Future<List<TopicCategory>> topicCategories() async {
    return meetupApi.topicCategories();
  }

  Future<List<MeetupNotification>> notifications() async {
    return meetupApi.notifications();
  }
}
