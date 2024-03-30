import 'package:get/get.dart';
import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/data_layer/models/order.dart';

class OrderController extends GetxController {
  late StatusRequest statusRequest;
  var responset;
  var responsetNot;
  int len = 0;
  bool load = true;
  dynamic getOrders() async {
    Curd curd = Curd();
    var respons = await curd.getrequest(
      "https://salon-app.nanots.ae/api/v1/user/order",
      myheadersres: curd.myheaders3,
    );

    return respons;
  }

  OrderModel? orderModel;
  getOrdersRes() async {
    try {
      statusRequest = StatusRequest.loading;
      responset = await getOrders();
      print("=========x> ${statusRequest}");
      statusRequest = handlingData(responset);
      if (statusRequest == StatusRequest.success) {
        print("xxxxxxxxx> ${responset} ");

        orderModel = await OrderModel.fromJson(responset);
        len = orderModel!.data!.length;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.erorr;
    }
  }

  @override
  void onInit() async {
    load = true;
    await getOrdersRes();
    // len = orderModel!.data!.length;
    load = false;
    update();
    super.onInit();
  }
}
