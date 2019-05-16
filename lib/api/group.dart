// To parse this JSON data, do
//
//     final group = groupFromJson(jsonString);

import 'dart:convert';

List<Group> groupsFromJson(String str) =>
    new List<Group>.from(json.decode(str).map((x) => Group.fromJson(x)));

String groupsToJson(List<Group> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Group {
  int id;
  String name;
  String status;
  String link;
  String urlname;
  String description;
  int created;
  String city;
  String untranslatedCity;
  String country;
  String localizedCountryName;
  String localizedLocation;
  String state;
  String joinMode;
  String visibility;
  double lat;
  double lon;
  int members;
  String who;
  Photo keyPhoto;
  String timezone;
  NextEvent nextEvent;
  Category category;
  MetaCategory metaCategory;
  Photo groupPhoto;
  ProNetwork proNetwork;

  Group({
    this.id,
    this.name,
    this.status,
    this.link,
    this.urlname,
    this.description,
    this.created,
    this.city,
    this.untranslatedCity,
    this.country,
    this.localizedCountryName,
    this.localizedLocation,
    this.state,
    this.joinMode,
    this.visibility,
    this.lat,
    this.lon,
    this.members,
    this.who,
    this.keyPhoto,
    this.timezone,
    this.nextEvent,
    this.category,
    this.metaCategory,
    this.groupPhoto,
    this.proNetwork,
  });

  factory Group.fromJson(Map<String, dynamic> json) => new Group(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        link: json["link"],
        urlname: json["urlname"],
        description: json["description"],
        created: json["created"],
        city: json["city"],
        untranslatedCity: json["untranslated_city"],
        country: json["country"],
        localizedCountryName: json["localized_country_name"],
        localizedLocation: json["localized_location"],
        state: json["state"],
        joinMode: json["join_mode"],
        visibility: json["visibility"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        members: json["members"],
        who: json["who"],
        keyPhoto: Photo.fromJson(json["key_photo"]),
        timezone: json["timezone"],
        nextEvent: json["next_event"] == null
            ? null
            : NextEvent.fromJson(json["next_event"]),
        category: Category.fromJson(json["category"]),
        metaCategory: MetaCategory.fromJson(json["meta_category"]),
        groupPhoto: json["group_photo"] == null
            ? null
            : Photo.fromJson(json["group_photo"]),
        proNetwork: json["pro_network"] == null
            ? null
            : ProNetwork.fromJson(json["pro_network"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "link": link,
        "urlname": urlname,
        "description": description,
        "created": created,
        "city": city,
        "untranslated_city": untranslatedCity,
        "country": country,
        "localized_country_name": localizedCountryName,
        "localized_location": localizedLocation,
        "state": state,
        "join_mode": joinMode,
        "visibility": visibility,
        "lat": lat,
        "lon": lon,
        "members": members,
        "who": who,
        "key_photo": keyPhoto.toJson(),
        "timezone": timezone,
        "next_event": nextEvent == null ? null : nextEvent.toJson(),
        "category": category.toJson(),
        "meta_category": metaCategory.toJson(),
        "group_photo": groupPhoto == null ? null : groupPhoto.toJson(),
        "pro_network": proNetwork == null ? null : proNetwork.toJson(),
      };
}

class Category {
  int id;
  String name;
  String shortname;
  String sortName;

  Category({
    this.id,
    this.name,
    this.shortname,
    this.sortName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => new Category(
        id: json["id"],
        name: json["name"],
        shortname: json["shortname"],
        sortName: json["sort_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortname": shortname,
        "sort_name": sortName,
      };
}

class Photo {
  int id;
  String highresLink;
  String photoLink;
  String thumbLink;
  Type type;
  String baseUrl;

  Photo({
    this.id,
    this.highresLink,
    this.photoLink,
    this.thumbLink,
    this.type,
    this.baseUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => new Photo(
        id: json["id"],
        highresLink: json["highres_link"],
        photoLink: json["photo_link"],
        thumbLink: json["thumb_link"],
        type: typeValues.map[json["type"]],
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "highres_link": highresLink,
        "photo_link": photoLink,
        "thumb_link": thumbLink,
        "type": typeValues.reverse[type],
        "base_url": baseUrl,
      };
}

enum Type { EVENT }

final typeValues = new EnumValues({"event": Type.EVENT});

class MetaCategory {
  int id;
  String shortname;
  String name;
  String sortName;
  Photo photo;
  List<int> categoryIds;

  MetaCategory({
    this.id,
    this.shortname,
    this.name,
    this.sortName,
    this.photo,
    this.categoryIds,
  });

  factory MetaCategory.fromJson(Map<String, dynamic> json) => new MetaCategory(
        id: json["id"],
        shortname: json["shortname"],
        name: json["name"],
        sortName: json["sort_name"],
        photo: Photo.fromJson(json["photo"]),
        categoryIds: new List<int>.from(json["category_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shortname": shortname,
        "name": name,
        "sort_name": sortName,
        "photo": photo.toJson(),
        "category_ids": new List<dynamic>.from(categoryIds.map((x) => x)),
      };
}

class NextEvent {
  String id;
  String name;
  int yesRsvpCount;
  int time;
  int utcOffset;

  NextEvent({
    this.id,
    this.name,
    this.yesRsvpCount,
    this.time,
    this.utcOffset,
  });

  factory NextEvent.fromJson(Map<String, dynamic> json) => new NextEvent(
        id: json["id"],
        name: json["name"],
        yesRsvpCount: json["yes_rsvp_count"],
        time: json["time"],
        utcOffset: json["utc_offset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "yes_rsvp_count": yesRsvpCount,
        "time": time,
        "utc_offset": utcOffset,
      };
}

class ProNetwork {
  String name;
  String urlname;
  int numberOfGroups;
  String networkUrl;

  ProNetwork({
    this.name,
    this.urlname,
    this.numberOfGroups,
    this.networkUrl,
  });

  factory ProNetwork.fromJson(Map<String, dynamic> json) => new ProNetwork(
        name: json["name"],
        urlname: json["urlname"],
        numberOfGroups: json["number_of_groups"],
        networkUrl: json["network_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "urlname": urlname,
        "number_of_groups": numberOfGroups,
        "network_url": networkUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
