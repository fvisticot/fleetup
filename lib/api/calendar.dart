class Calendar {
  int created;
  int duration;
  String id;
  String name;
  int rsvpLimit;
  bool dateInSeriesPattern;
  String status;
  int time;
  String localDate;
  String localTime;
  int updated;
  int utcOffset;
  int waitlistCount;
  int yesRsvpCount;
  Venue venue;
  Group group;
  String link;
  String description;
  String howToFindUs;
  String visibility;

  Calendar(
      {this.created,
      this.duration,
      this.id,
      this.name,
      this.rsvpLimit,
      this.dateInSeriesPattern,
      this.status,
      this.time,
      this.localDate,
      this.localTime,
      this.updated,
      this.utcOffset,
      this.waitlistCount,
      this.yesRsvpCount,
      this.venue,
      this.group,
      this.link,
      this.description,
      this.howToFindUs,
      this.visibility});

  Calendar.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    duration = json['duration'];
    id = json['id'];
    name = json['name'];
    rsvpLimit = json['rsvp_limit'];
    dateInSeriesPattern = json['date_in_series_pattern'];
    status = json['status'];
    time = json['time'];
    localDate = json['local_date'];
    localTime = json['local_time'];
    updated = json['updated'];
    utcOffset = json['utc_offset'];
    waitlistCount = json['waitlist_count'];
    yesRsvpCount = json['yes_rsvp_count'];
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
    link = json['link'];
    description = json['description'];
    howToFindUs = json['how_to_find_us'];
    visibility = json['visibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['duration'] = this.duration;
    data['id'] = this.id;
    data['name'] = this.name;
    data['rsvp_limit'] = this.rsvpLimit;
    data['date_in_series_pattern'] = this.dateInSeriesPattern;
    data['status'] = this.status;
    data['time'] = this.time;
    data['local_date'] = this.localDate;
    data['local_time'] = this.localTime;
    data['updated'] = this.updated;
    data['utc_offset'] = this.utcOffset;
    data['waitlist_count'] = this.waitlistCount;
    data['yes_rsvp_count'] = this.yesRsvpCount;
    if (this.venue != null) {
      data['venue'] = this.venue.toJson();
    }
    if (this.group != null) {
      data['group'] = this.group.toJson();
    }
    data['link'] = this.link;
    data['description'] = this.description;
    data['how_to_find_us'] = this.howToFindUs;
    data['visibility'] = this.visibility;
    return data;
  }
}

class Venue {
  int id;
  String name;
  double lat;
  double lon;
  bool repinned;
  String address1;
  String city;
  String country;
  String localizedCountryName;

  Venue(
      {this.id,
      this.name,
      this.lat,
      this.lon,
      this.repinned,
      this.address1,
      this.city,
      this.country,
      this.localizedCountryName});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    repinned = json['repinned'];
    address1 = json['address_1'];
    city = json['city'];
    country = json['country'];
    localizedCountryName = json['localized_country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['repinned'] = this.repinned;
    data['address_1'] = this.address1;
    data['city'] = this.city;
    data['country'] = this.country;
    data['localized_country_name'] = this.localizedCountryName;
    return data;
  }
}

class Group {
  int created;
  String name;
  int id;
  String joinMode;
  double lat;
  double lon;
  String urlname;
  String who;
  String localizedLocation;
  String state;
  String country;
  String region;
  String timezone;

  Group(
      {this.created,
      this.name,
      this.id,
      this.joinMode,
      this.lat,
      this.lon,
      this.urlname,
      this.who,
      this.localizedLocation,
      this.state,
      this.country,
      this.region,
      this.timezone});

  Group.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    name = json['name'];
    id = json['id'];
    joinMode = json['join_mode'];
    lat = json['lat'];
    lon = json['lon'];
    urlname = json['urlname'];
    who = json['who'];
    localizedLocation = json['localized_location'];
    state = json['state'];
    country = json['country'];
    region = json['region'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['name'] = this.name;
    data['id'] = this.id;
    data['join_mode'] = this.joinMode;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['urlname'] = this.urlname;
    data['who'] = this.who;
    data['localized_location'] = this.localizedLocation;
    data['state'] = this.state;
    data['country'] = this.country;
    data['region'] = this.region;
    data['timezone'] = this.timezone;
    return data;
  }
}
