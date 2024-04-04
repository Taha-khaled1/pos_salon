class StaticModel {
  bool? success;
  int? code;
  Null? direct;
  String? message;
  Data? data;

  StaticModel({this.success, this.code, this.direct, this.message, this.data});

  StaticModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    direct = json['direct'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['direct'] = this.direct;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Reservations>? reservations;
  int? totalSelling;
  int? visitors;
  TopServiceSales? topServiceSales;
  List<LatestReservations>? latestReservations;
  List<BestSellingServices>? bestSellingServices;
  Rates? rates;

  Data(
      {this.reservations,
      this.totalSelling,
      this.visitors,
      this.topServiceSales,
      this.latestReservations,
      this.bestSellingServices,
      this.rates});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['reservations'] != null) {
      reservations = <Reservations>[];
      json['reservations'].forEach((v) {
        reservations!.add(new Reservations.fromJson(v));
      });
    }
    totalSelling = json['total_selling'];
    visitors = json['visitors'];
    topServiceSales = json['top_service_sales'] != null
        ? new TopServiceSales.fromJson(json['top_service_sales'])
        : null;
    if (json['latest_reservations'] != null) {
      latestReservations = <LatestReservations>[];
      json['latest_reservations'].forEach((v) {
        latestReservations!.add(new LatestReservations.fromJson(v));
      });
    }
    if (json['best_selling_services'] != null) {
      bestSellingServices = <BestSellingServices>[];
      json['best_selling_services'].forEach((v) {
        bestSellingServices!.add(new BestSellingServices.fromJson(v));
      });
    }
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reservations != null) {
      data['reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    }
    data['total_selling'] = this.totalSelling;
    data['visitors'] = this.visitors;
    if (this.topServiceSales != null) {
      data['top_service_sales'] = this.topServiceSales!.toJson();
    }
    if (this.latestReservations != null) {
      data['latest_reservations'] =
          this.latestReservations!.map((v) => v.toJson()).toList();
    }
    if (this.bestSellingServices != null) {
      data['best_selling_services'] =
          this.bestSellingServices!.map((v) => v.toJson()).toList();
    }
    if (this.rates != null) {
      data['rates'] = this.rates!.toJson();
    }
    return data;
  }
}

class Reservations {
  Day? day;
  String? date;
  List<Reservations>? reservations;

  Reservations({this.day, this.date, this.reservations});

  Reservations.fromJson(Map<String, dynamic> json) {
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    date = json['date'];
    if (json['reservations'] != null) {
      reservations = <Reservations>[];
      json['reservations'].forEach((v) {
        reservations!.add(new Reservations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.day != null) {
      data['day'] = this.day!.toJson();
    }
    data['date'] = this.date;
    if (this.reservations != null) {
      data['reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  int? id;
  String? title;

  Day({this.id, this.title});

  Day.fromJson(Map<String, dynamic> json) {
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

class ReservationsStatic {
  String? from;
  String? end;
  int? reservationsCount;

  ReservationsStatic({this.from, this.end, this.reservationsCount});

  ReservationsStatic.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    end = json['end'];
    reservationsCount = json['reservations_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['end'] = this.end;
    data['reservations_count'] = this.reservationsCount;
    return data;
  }
}

class TopServiceSales {
  List<int>? counts;
  List<String>? months;

  TopServiceSales({this.counts, this.months});

  TopServiceSales.fromJson(Map<String, dynamic> json) {
    counts = json['counts'].cast<int>();
    months = json['months'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counts'] = this.counts;
    data['months'] = this.months;
    return data;
  }
}

class LatestReservations {
  int? id;
  Customer? customer;
  Salon? salon;
  String? orderStatus;
  String? paymentMethod;
  String? paymentStatus;
  Null? employee;
  String? numberOfIndividuals;
  Null? notes;
  Null? discountCode;
  int? discountAmount;
  int? totalCost;
  String? date;
  OrderBill? orderBill;
  List<Services>? services;

  LatestReservations(
      {this.id,
      this.customer,
      this.salon,
      this.orderStatus,
      this.paymentMethod,
      this.paymentStatus,
      this.employee,
      this.numberOfIndividuals,
      this.notes,
      this.discountCode,
      this.discountAmount,
      this.totalCost,
      this.date,
      this.orderBill,
      this.services});

  LatestReservations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    salon = json['salon'] != null ? new Salon.fromJson(json['salon']) : null;
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    employee = json['employee'];
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
    data['employee'] = this.employee;
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
  Day? emirate;
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
        json['emirate'] != null ? new Day.fromJson(json['emirate']) : null;
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

class Salon {
  int? id;
  String? title;
  String? description;
  WorkingDay? workingDay;
  String? salonLogo;
  List<Null>? salonGalleries;
  Rate? rate;
  Location? location;
  List<SalonCategories>? salonCategories;
  Reviews? reviews;

  Salon(
      {this.id,
      this.title,
      this.description,
      this.workingDay,
      this.salonLogo,
      this.salonGalleries,
      this.rate,
      this.location,
      this.salonCategories,
      this.reviews});

  Salon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    workingDay = json['working_day'] != null
        ? new WorkingDay.fromJson(json['working_day'])
        : null;
    salonLogo = json['salon_logo'];

    rate = json['rate'] != null ? new Rate.fromJson(json['rate']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['salon_categories'] != null) {
      salonCategories = <SalonCategories>[];
      json['salon_categories'].forEach((v) {
        salonCategories!.add(new SalonCategories.fromJson(v));
      });
    }
    reviews =
        json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
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

    if (this.rate != null) {
      data['rate'] = this.rate!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.salonCategories != null) {
      data['salon_categories'] =
          this.salonCategories!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    return data;
  }
}

class WorkingDay {
  Day? dayFrom;
  Day? dayTo;
  String? timeFrom;
  String? timeTo;

  WorkingDay({this.dayFrom, this.dayTo, this.timeFrom, this.timeTo});

  WorkingDay.fromJson(Map<String, dynamic> json) {
    dayFrom =
        json['day_from'] != null ? new Day.fromJson(json['day_from']) : null;
    dayTo = json['day_to'] != null ? new Day.fromJson(json['day_to']) : null;
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

class SalonCategories {
  int? id;
  String? title;
  String? image;

  SalonCategories({this.id, this.title, this.image});

  SalonCategories.fromJson(Map<String, dynamic> json) {
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

class ReviewsStatic {
  int? count1;
  int? count2;
  int? count3;
  int? count4;
  int? count5;
  List<ReviewsStatic>? reviews;

  ReviewsStatic(
      {this.count1,
      this.count2,
      this.count3,
      this.count4,
      this.count5,
      this.reviews});

  ReviewsStatic.fromJson(Map<String, dynamic> json) {
    count1 = json['count_1'];
    count2 = json['count_2'];
    count3 = json['count_3'];
    count4 = json['count_4'];
    count5 = json['count_5'];
    if (json['reviews'] != null) {
      reviews = <ReviewsStatic>[];
      json['reviews'].forEach((v) {
        reviews!.add(new ReviewsStatic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_1'] = this.count1;
    data['count_2'] = this.count2;
    data['count_3'] = this.count3;
    data['count_4'] = this.count4;
    data['count_5'] = this.count5;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int? id;
  CustomerO? customer;
  int? rate;
  String? review;
  String? createdAt;

  Reviews({this.id, this.customer, this.rate, this.review, this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'] != null
        ? new CustomerO.fromJson(json['customer'])
        : null;
    rate = json['rate'];
    review = json['review'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['rate'] = this.rate;
    data['review'] = this.review;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class CustomerO {
  int? id;
  String? name;
  String? phone;
  String? profileImage;

  CustomerO({this.id, this.name, this.phone, this.profileImage});

  CustomerO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['profile_image'] = this.profileImage;
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
  SalonCategories? service;
  String? from;
  String? to;
  int? price;
  // List<Null>? orderServiceOptions;

  Services({
    this.orderServiceId,
    this.service,
    this.from,
    this.to,
    this.price,
  });

  Services.fromJson(Map<String, dynamic> json) {
    orderServiceId = json['order_service_id'];
    service = json['service'] != null
        ? new SalonCategories.fromJson(json['service'])
        : null;
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

class BestSellingServices {
  int? id;
  Category? category;
  String? title;
  int? price;
  WorkingDay? workingDays;
  String? description;
  int? reservationDuration;
  String? image;
  List<Options>? options;

  BestSellingServices(
      {this.id,
      this.category,
      this.title,
      this.price,
      this.workingDays,
      this.description,
      this.reservationDuration,
      this.image,
      this.options});

  BestSellingServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    title = json['title'];
    price = json['price'];
    workingDays = json['working_days'] != null
        ? new WorkingDay.fromJson(json['working_days'])
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

class Rates {
  double? avgRate;
  int? rateCount;
  double? employeeRate;
  double? serviceRate;
  int? otherRate;

  Rates(
      {this.avgRate,
      this.rateCount,
      this.employeeRate,
      this.serviceRate,
      this.otherRate});

  Rates.fromJson(Map<String, dynamic> json) {
    avgRate = json['avg_rate'];
    rateCount = json['rate_count'];
    employeeRate = json['employee_rate'];
    serviceRate = json['service_rate'];
    otherRate = json['other_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avg_rate'] = this.avgRate;
    data['rate_count'] = this.rateCount;
    data['employee_rate'] = this.employeeRate;
    data['service_rate'] = this.serviceRate;
    data['other_rate'] = this.otherRate;
    return data;
  }
}
