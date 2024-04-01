class CatogeryesModel {
  bool? success;
  int? code;
  Null? direct;
  String? message;
  List<DataCatogery>? data;

  CatogeryesModel(
      {this.success, this.code, this.direct, this.message, this.data});

  CatogeryesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    direct = json['direct'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataCatogery>[];
      json['data'].forEach((v) {
        data!.add(new DataCatogery.fromJson(v));
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

class DataCatogery {
  int? id;
  String? title;
  int? servicesCount;

  DataCatogery({this.id, this.title, this.servicesCount});

  DataCatogery.fromJson(Map<String, dynamic> json) {
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
