import 'package:get/get.dart';
import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/data_layer/models/static_model.dart';

class ReportController extends GetxController {
  late StatusRequest statusRequest;
  var response;
  var responset;
  var responsetNot;
  bool load = true;
  StaticModel? staticModel;

  getHomeRes() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getReport();
      statusRequest = handlingData(response);
      print("=========x> ${statusRequest}");
      if (statusRequest == StatusRequest.success) {
        print("xxxxxxxxx> ${statusRequest}");
        staticModel = await StaticModel.fromJson(response);
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

dynamic getReport() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "https://salon-app.nanots.ae/api/v1/user/home",
    myheadersres: curd.myheaders3,
  );

  return respons;
}
