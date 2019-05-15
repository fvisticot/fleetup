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
  KeyPhoto keyPhoto;
  String timezone;
  NextEvent nextEvent;
  Category category;
  MetaCategory metaCategory;

  Group(
      {this.id,
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
      this.metaCategory});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    link = json['link'];
    urlname = json['urlname'];
    description = json['description'];
    created = json['created'];
    city = json['city'];
    untranslatedCity = json['untranslated_city'];
    country = json['country'];
    localizedCountryName = json['localized_country_name'];
    localizedLocation = json['localized_location'];
    state = json['state'];
    joinMode = json['join_mode'];
    visibility = json['visibility'];
    lat = json['lat'];
    lon = json['lon'];
    members = json['members'];
    who = json['who'];
    keyPhoto = json['key_photo'] != null
        ? new KeyPhoto.fromJson(json['key_photo'])
        : null;
    timezone = json['timezone'];
    nextEvent = json['next_event'] != null
        ? new NextEvent.fromJson(json['next_event'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    metaCategory = json['meta_category'] != null
        ? new MetaCategory.fromJson(json['meta_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['link'] = this.link;
    data['urlname'] = this.urlname;
    data['description'] = this.description;
    data['created'] = this.created;
    data['city'] = this.city;
    data['untranslated_city'] = this.untranslatedCity;
    data['country'] = this.country;
    data['localized_country_name'] = this.localizedCountryName;
    data['localized_location'] = this.localizedLocation;
    data['state'] = this.state;
    data['join_mode'] = this.joinMode;
    data['visibility'] = this.visibility;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['members'] = this.members;
    data['who'] = this.who;
    if (this.keyPhoto != null) {
      data['key_photo'] = this.keyPhoto.toJson();
    }
    data['timezone'] = this.timezone;
    if (this.nextEvent != null) {
      data['next_event'] = this.nextEvent.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.metaCategory != null) {
      data['meta_category'] = this.metaCategory.toJson();
    }
    return data;
  }
}

class KeyPhoto {
  int id;
  String highresLink;
  String photoLink;
  String thumbLink;
  String type;
  String baseUrl;

  KeyPhoto(
      {this.id,
      this.highresLink,
      this.photoLink,
      this.thumbLink,
      this.type,
      this.baseUrl});

  KeyPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    highresLink = json['highres_link'];
    photoLink = json['photo_link'];
    thumbLink = json['thumb_link'];
    type = json['type'];
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['highres_link'] = this.highresLink;
    data['photo_link'] = this.photoLink;
    data['thumb_link'] = this.thumbLink;
    data['type'] = this.type;
    data['base_url'] = this.baseUrl;
    return data;
  }
}

class NextEvent {
  String id;
  String name;
  int yesRsvpCount;
  int time;
  int utcOffset;

  NextEvent({this.id, this.name, this.yesRsvpCount, this.time, this.utcOffset});

  NextEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    yesRsvpCount = json['yes_rsvp_count'];
    time = json['time'];
    utcOffset = json['utc_offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['yes_rsvp_count'] = this.yesRsvpCount;
    data['time'] = this.time;
    data['utc_offset'] = this.utcOffset;
    return data;
  }
}

class Category {
  int id;
  String name;
  String shortname;
  String sortName;

  Category({this.id, this.name, this.shortname, this.sortName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortname = json['shortname'];
    sortName = json['sort_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortname'] = this.shortname;
    data['sort_name'] = this.sortName;
    return data;
  }
}

class MetaCategory {
  int id;
  String shortname;
  String name;
  String sortName;
  Photo photo;
  List<int> categoryIds;

  MetaCategory(
      {this.id,
      this.shortname,
      this.name,
      this.sortName,
      this.photo,
      this.categoryIds});

  MetaCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shortname = json['shortname'];
    name = json['name'];
    sortName = json['sort_name'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    categoryIds = json['category_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shortname'] = this.shortname;
    data['name'] = this.name;
    data['sort_name'] = this.sortName;
    if (this.photo != null) {
      data['photo'] = this.photo.toJson();
    }
    data['category_ids'] = this.categoryIds;
    return data;
  }
}

class Photo {
  int id;
  String highresLink;
  String photoLink;
  String thumbLink;
  String type;
  String baseUrl;

  Photo(
      {this.id,
      this.highresLink,
      this.photoLink,
      this.thumbLink,
      this.type,
      this.baseUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    highresLink = json['highres_link'];
    photoLink = json['photo_link'];
    thumbLink = json['thumb_link'];
    type = json['type'];
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['highres_link'] = this.highresLink;
    data['photo_link'] = this.photoLink;
    data['thumb_link'] = this.thumbLink;
    data['type'] = this.type;
    data['base_url'] = this.baseUrl;
    return data;
  }
}
