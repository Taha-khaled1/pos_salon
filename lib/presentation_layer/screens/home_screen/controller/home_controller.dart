import 'package:get/get.dart';
import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/data_layer/models/cato.dart';
import 'package:pos_animal/data_layer/models/service.dart';

class HomeController extends GetxController {
  bool hasUnreadNotifications = false;

  late StatusRequest statusRequest;
  var response;
  var responset;
  var responsetNot;
  bool load = true;
  ServiceModel? serviceModel;
  CatogeryesModel? catogeryesModel;
  getHomeRes() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getServices();
      responset = await getCatogery();

      statusRequest = handlingData(response);
      print("=========x> ${statusRequest}");
      if (statusRequest == StatusRequest.success) {
        print("xxxxxxxxx> ${statusRequest}");
        catogeryesModel = await CatogeryesModel.fromJson(responset);
        serviceModel = await ServiceModel.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.erorr;
    }
  }

  void manualUpdate() {
    update();
  }

  @override
  void onInit() async {
    load = true;
    await getHomeRes();
    update();
    load = false;
    super.onInit();
  }
}

dynamic getCatogery() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "https://salon-app.nanots.ae/api/v1/user/category",
    myheadersres: curd.myheaders3,
  );
  // print("$respons");
  return respons;
}

dynamic getServices() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "https://salon-app.nanots.ae/api/v1/user/service",
    myheadersres: curd.myheaders3,
  );

  return respons;
}
