// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

List<MeetupNotification> notificationsFromJson(String str) =>
    new List<MeetupNotification>.from(
        json.decode(str).map((x) => MeetupNotification.fromJson(x)));

String notificationsToJson(List<MeetupNotification> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class MeetupNotification {
  String kind;
  Category category;
  String id;
  String text;
  String link;
  Target target;
  int updated;
  bool important;
  bool read;
  bool clicked;
  PhotoTypeEnum photoType;
  Setting setting;
  Photo photo;
  Self self;

  MeetupNotification({
    this.kind,
    this.category,
    this.id,
    this.text,
    this.link,
    this.target,
    this.updated,
    this.important,
    this.read,
    this.clicked,
    this.photoType,
    this.setting,
    this.photo,
    this.self,
  });

  factory MeetupNotification.fromJson(Map<String, dynamic> json) =>
      new MeetupNotification(
        kind: json["kind"],
        category: categoryValues.map[json["category"]],
        id: json["id"],
        text: json["text"],
        link: json["link"],
        target: Target.fromJson(json["target"]),
        updated: json["updated"],
        important: json["important"],
        read: json["read"],
        clicked: json["clicked"],
        photoType: photoTypeEnumValues.map[json["photo_type"]],
        setting: Setting.fromJson(json["setting"]),
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        self: json["self"] == null ? null : Self.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "category": categoryValues.reverse[category],
        "id": id,
        "text": text,
        "link": link,
        "target": target.toJson(),
        "updated": updated,
        "important": important,
        "read": read,
        "clicked": clicked,
        "photo_type": photoTypeEnumValues.reverse[photoType],
        "setting": setting.toJson(),
        "photo": photo == null ? null : photo.toJson(),
        "self": self == null ? null : self.toJson(),
      };
}

enum Category { GROUP, EVENT, COMMENT }

final categoryValues = new EnumValues({
  "comment": Category.COMMENT,
  "event": Category.EVENT,
  "group": Category.GROUP
});

class Photo {
  int id;
  String highresLink;
  String photoLink;
  String thumbLink;
  PhotoTypeEnum type;
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
        type: photoTypeEnumValues.map[json["type"]],
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "highres_link": highresLink,
        "photo_link": photoLink,
        "thumb_link": thumbLink,
        "type": photoTypeEnumValues.reverse[type],
        "base_url": baseUrl,
      };
}

enum PhotoTypeEnum { MEMBER, EVENT }

final photoTypeEnumValues = new EnumValues(
    {"event": PhotoTypeEnum.EVENT, "member": PhotoTypeEnum.MEMBER});

class Self {
  Action action;

  Self({
    this.action,
  });

  factory Self.fromJson(Map<String, dynamic> json) => new Self(
        action: actionValues.map[json["action"]],
      );

  Map<String, dynamic> toJson() => {
        "action": actionValues.reverse[action],
      };
}

enum Action { INSTANT_JOIN, FORM_RSVP, INSTANT_RSVP }

final actionValues = new EnumValues({
  "form_rsvp": Action.FORM_RSVP,
  "instant_join": Action.INSTANT_JOIN,
  "instant_rsvp": Action.INSTANT_RSVP
});

class Setting {
  Push push;
  Email email;

  Setting({
    this.push,
    this.email,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => new Setting(
        push: json["push"] == null ? null : Push.fromJson(json["push"]),
        email: json["email"] == null ? null : Email.fromJson(json["email"]),
      );

  Map<String, dynamic> toJson() => {
        "push": push == null ? null : push.toJson(),
        "email": email == null ? null : email.toJson(),
      };
}

class Email {
  String name;

  Email({
    this.name,
  });

  factory Email.fromJson(Map<String, dynamic> json) => new Email(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Push {
  String name;
  String groupUrlname;
  int groupId;

  Push({
    this.name,
    this.groupUrlname,
    this.groupId,
  });

  factory Push.fromJson(Map<String, dynamic> json) => new Push(
        name: json["name"],
        groupUrlname:
            json["group_urlname"] == null ? null : json["group_urlname"],
        groupId: json["group_id"] == null ? null : json["group_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "group_urlname": groupUrlname == null ? null : groupUrlname,
        "group_id": groupId == null ? null : groupId,
      };
}

class Target {
  TargetType type;
  int groupId;
  String groupUrlname;
  bool pending;
  String eventId;
  int commentId;

  Target({
    this.type,
    this.groupId,
    this.groupUrlname,
    this.pending,
    this.eventId,
    this.commentId,
  });

  factory Target.fromJson(Map<String, dynamic> json) => new Target(
        type: targetTypeValues.map[json["type"]],
        groupId: json["group_id"],
        groupUrlname: json["group_urlname"],
        pending: json["pending"] == null ? null : json["pending"],
        eventId: json["event_id"] == null ? null : json["event_id"],
        commentId: json["comment_id"] == null ? null : json["comment_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": targetTypeValues.reverse[type],
        "group_id": groupId,
        "group_urlname": groupUrlname,
        "pending": pending == null ? null : pending,
        "event_id": eventId == null ? null : eventId,
        "comment_id": commentId == null ? null : commentId,
      };
}

enum TargetType { GROUP_MEMBER_LIST, EVENT, EVENT_COMMENTS, GROUP }

final targetTypeValues = new EnumValues({
  "event": TargetType.EVENT,
  "event_comments": TargetType.EVENT_COMMENTS,
  "group": TargetType.GROUP,
  "group_member_list": TargetType.GROUP_MEMBER_LIST
});

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
