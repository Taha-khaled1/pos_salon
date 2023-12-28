import 'package:get/get.dart';
import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/data_layer/database/database.dart';

class HomeController extends GetxController {
  late StatusRequest statusRequest;
  var response;
  bool load = true;
  getHomeRes() async {
    try {
      statusRequest = StatusRequest.loading;
      response = await getHome();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print('----------------------------------');
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
  // getHome() {}
}

dynamic getHome() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "https://salon-app.nanots.ae/api/v1/user/service",
  );

  return respons;
}
