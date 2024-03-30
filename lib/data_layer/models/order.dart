class OrderModel {
  bool? success;
  int? code;

  String? message;
  List<Data>? data;

  OrderModel({this.success, this.code, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
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
  Customer? customer;
  Salon? salon;
  String? orderStatus;
  String? paymentMethod;
  String? paymentStatus;
  String? numberOfIndividuals;
  String? notes;
  double? discountCode;
  int? discountAmount;
  int? totalCost;
  String? date;
  OrderBill? orderBill;
  List<Services>? services;

  Data(
      {this.id,
      this.customer,
      this.salon,
      this.orderStatus,
      this.paymentMethod,
      this.paymentStatus,
      this.numberOfIndividuals,
      this.notes,
      this.discountCode,
      this.discountAmount,
      this.totalCost,
      this.date,
      this.orderBill,
      this.services});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    salon = json['salon'] != null ? new Salon.fromJson(json['salon']) : null;
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    numberOfIndividuals = json['number_of_individuals'];
    notes = json['notes'];
    discountCode = json['discount_code'];
    discountAmount = json['discount_amount'];
    totalCost = json['total_cost'];
    date = json['date'];
    orderBill = json['order_bill'] != null
        ? new OrderBill.fromJson(json['order_bill'])
        : null;
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.salon != null) {
      data['salon'] = this.salon!.toJson();
    }
    data['order_status'] = this.orderStatus;
    data['payment_method'] = this.paymentMethod;
    data['payment_status'] = this.paymentStatus;
    data['number_of_individuals'] = this.numberOfIndividuals;
    data['notes'] = this.notes;
    data['discount_code'] = this.discountCode;
    data['discount_amount'] = this.discountAmount;
    data['total_cost'] = this.totalCost;
    data['date'] = this.date;
    if (this.orderBill != null) {
      data['order_bill'] = this.orderBill!.toJson();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
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

  Customer(
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

  Customer.fromJson(Map<String, dynamic> json) {
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

class Salon {
  int? id;
  String? title;
  String? description;
  WorkingDay? workingDay;
  String? salonLogo;
  List<String>? salonGalleries;
  Rate? rate;
  Location? location;

  Salon(
      {this.id,
      this.title,
      this.description,
      this.workingDay,
      this.salonLogo,
      this.salonGalleries,
      this.rate,
      this.location});

  Salon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    workingDay = json['working_day'] != null
        ? new WorkingDay.fromJson(json['working_day'])
        : null;
    salonLogo = json['salon_logo'];
    salonGalleries = json['salon_galleries'].cast<String>();
    rate = json['rate'] != null ? new Rate.fromJson(json['rate']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.workingDay != null) {
      data['working_day'] = this.workingDay!.toJson();
    }
    data['salon_logo'] = this.salonLogo;
    data['salon_galleries'] = this.salonGalleries;
    if (this.rate != null) {
      data['rate'] = this.rate!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class WorkingDay {
  Emirate? dayFrom;
  Emirate? dayTo;
  String? timeFrom;
  String? timeTo;

  WorkingDay({this.dayFrom, this.dayTo, this.timeFrom, this.timeTo});

  WorkingDay.fromJson(Map<String, dynamic> json) {
    dayFrom = json['day_from'] != null
        ? new Emirate.fromJson(json['day_from'])
        : null;
    dayTo =
        json['day_to'] != null ? new Emirate.fromJson(json['day_to']) : null;
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

class Rate {
  double? avg;
  int? count;

  Rate({this.avg, this.count});

  Rate.fromJson(Map<String, dynamic> json) {
    avg = json['avg'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avg'] = this.avg;
    data['count'] = this.count;
    return data;
  }
}

class OrderBill {
  int? id;
  int? orderId;
  int? salonId;
  String? billPaymentStatus;
  int? totalCost;
  String? billCode;
  String? createdAt;
  String? updatedAt;

  OrderBill(
      {this.id,
      this.orderId,
      this.salonId,
      this.billPaymentStatus,
      this.totalCost,
      this.billCode,
      this.createdAt,
      this.updatedAt});

  OrderBill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    salonId = json['salon_id'];
    billPaymentStatus = json['bill_payment_status'];
    totalCost = json['total_cost'];
    billCode = json['bill_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['salon_id'] = this.salonId;
    data['bill_payment_status'] = this.billPaymentStatus;
    data['total_cost'] = this.totalCost;
    data['bill_code'] = this.billCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Services {
  int? orderServiceId;
  Service? service;
  String? from;
  String? to;
  int? price;

  Services({this.orderServiceId, this.service, this.from, this.to, this.price});

  Services.fromJson(Map<String, dynamic> json) {
    orderServiceId = json['order_service_id'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    from = json['from'];
    to = json['to'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_service_id'] = this.orderServiceId;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['from'] = this.from;
    data['to'] = this.to;
    data['price'] = this.price;
    return data;
  }
}

class Service {
  int? id;
  String? title;
  String? image;

  Service({this.id, this.title, this.image});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
