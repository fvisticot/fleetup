class Member {
  int id;
  String name;
  String email;
  String status;
  int joined;
  String city;
  String country;
  String localizedCountryName;
  double lat;
  double lon;
  Photo photo;
  bool isProAdmin;

  Member(
      {this.id,
      this.name,
      this.email,
      this.status,
      this.joined,
      this.city,
      this.country,
      this.localizedCountryName,
      this.lat,
      this.lon,
      this.photo,
      this.isProAdmin});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    joined = json['joined'];
    city = json['city'];
    country = json['country'];
    localizedCountryName = json['localized_country_name'];
    lat = json['lat'];
    lon = json['lon'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    isProAdmin = json['is_pro_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['joined'] = this.joined;
    data['city'] = this.city;
    data['country'] = this.country;
    data['localized_country_name'] = this.localizedCountryName;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    if (this.photo != null) {
      data['photo'] = this.photo.toJson();
    }
    data['is_pro_admin'] = this.isProAdmin;
    return data;
  }
}

class Photo {
  int id;
  String photoLink;
  String thumbLink;
  String type;
  String baseUrl;

  Photo({this.id, this.photoLink, this.thumbLink, this.type, this.baseUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photoLink = json['photo_link'];
    thumbLink = json['thumb_link'];
    type = json['type'];
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo_link'] = this.photoLink;
    data['thumb_link'] = this.thumbLink;
    data['type'] = this.type;
    data['base_url'] = this.baseUrl;
    return data;
  }
}
