class ServiceModel {
  bool? success;
  int? code;
  Null? direct;
  String? message;
  List<Data>? data;

  ServiceModel({this.success, this.code, this.direct, this.message, this.data});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    direct = json['direct'];
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
    data['direct'] = this.direct;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Category? category;
  String? title;
  int? price;
  WorkingDays? workingDays;
  String? description;
  int? reservationDuration;
  String? image;
  List<Options>? options;

  Data(
      {this.id,
      this.category,
      this.title,
      this.price,
      this.workingDays,
      this.description,
      this.reservationDuration,
      this.image,
      this.options});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    title = json['title'];
    price = json['price'];
    workingDays = json['working_days'] != null
        ? new WorkingDays.fromJson(json['working_days'])
        : null;
    description = json['description'];
    reservationDuration = json['reservation_duration'];
    image = json['image'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['title'] = this.title;
    data['price'] = this.price;
    if (this.workingDays != null) {
      data['working_days'] = this.workingDays!.toJson();
    }
    data['description'] = this.description;
    data['reservation_duration'] = this.reservationDuration;
    data['image'] = this.image;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;
  int? servicesCount;

  Category({this.id, this.title, this.servicesCount});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    servicesCount = json['services_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['services_count'] = this.servicesCount;
    return data;
  }
}

class WorkingDays {
  DayFrom? dayFrom;
  DayFrom? dayTo;
  String? timeFrom;
  String? timeTo;

  WorkingDays({this.dayFrom, this.dayTo, this.timeFrom, this.timeTo});

  WorkingDays.fromJson(Map<String, dynamic> json) {
    dayFrom = json['day_from'] != null
        ? new DayFrom.fromJson(json['day_from'])
        : null;
    dayTo =
        json['day_to'] != null ? new DayFrom.fromJson(json['day_to']) : null;
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dayFrom != null) {
      data['day_from'] = this.dayFrom!.toJson();
    }
    if (this.dayTo != null) {
      data['day_to'] = this.dayTo!.toJson();
    }
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    return data;
  }
}

class DayFrom {
  int? id;
  String? title;

  DayFrom({this.id, this.title});

  DayFrom.fromJson(Map<String, dynamic> json) {
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

class Options {
  int? id;
  String? title;
  int? price;
  String? image;

  Options({this.id, this.title, this.price, this.image});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
