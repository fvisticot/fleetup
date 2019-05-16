// To parse this JSON data, do
//
//     final topicCategory = topicCategoryFromJson(jsonString);

import 'dart:convert';

List<TopicCategory> topicCategoriesFromJson(String str) =>
    new List<TopicCategory>.from(
        json.decode(str).map((x) => TopicCategory.fromJson(x)));

String topicCategoriesToJson(List<TopicCategory> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class TopicCategory {
  int id;
  String shortname;
  String name;
  String sortName;
  Photo photo;
  List<int> categoryIds;

  TopicCategory({
    this.id,
    this.shortname,
    this.name,
    this.sortName,
    this.photo,
    this.categoryIds,
  });

  factory TopicCategory.fromJson(Map<String, dynamic> json) =>
      new TopicCategory(
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
