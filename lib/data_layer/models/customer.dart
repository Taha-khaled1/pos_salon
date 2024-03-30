class CustomerModel {
  bool? success;
  int? code;

  String? message;
  List<Data>? data;

  CustomerModel({this.success, this.code, this.message, this.data});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];

    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;

    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? socialLoginType;
  String? socialLoginId;
  String? profileImage;
  Location? location;
  Emirate? emirate;
  String? deviceToken;
  String? defaultLang;
  int? enableNotification;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.socialLoginType,
      this.socialLoginId,
      this.profileImage,
      this.location,
      this.emirate,
      this.deviceToken,
      this.defaultLang,
      this.enableNotification});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    socialLoginType = json['social_login_type'];
    socialLoginId = json['social_login_id'];
    profileImage = json['profile_image'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    emirate =
        json['emirate'] != null ? new Emirate.fromJson(json['emirate']) : null;
    deviceToken = json['device_token'];
    defaultLang = json['default_lang'];
    enableNotification = json['enable_notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['social_login_type'] = this.socialLoginType;
    data['social_login_id'] = this.socialLoginId;
    data['profile_image'] = this.profileImage;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.emirate != null) {
      data['emirate'] = this.emirate!.toJson();
    }
    data['device_token'] = this.deviceToken;
    data['default_lang'] = this.defaultLang;
    data['enable_notification'] = this.enableNotification;
    return data;
  }
}

class Location {
  String? address;
  String? lat;
  String? long;

  Location({this.address, this.lat, this.long});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Emirate {
  int? id;
  String? title;

  Emirate({this.id, this.title});

  Emirate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
