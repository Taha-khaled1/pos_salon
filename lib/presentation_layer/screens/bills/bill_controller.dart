import 'package:get/get.dart';
import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/data_layer/models/bill.dart';
import 'package:pos_animal/data_layer/models/order.dart';

class BillController extends GetxController {
  late StatusRequest statusRequest;
  var responset;
  int len = 0;
  bool load = true;
  dynamic getBill() async {
    Curd curd = Curd();
    var respons = await curd.getrequest(
      "https://salon-app.nanots.ae/api/v1/user/bill",
      myheadersres: curd.myheaders3,
    );

    return respons;
  }

  BillModel? billModel;
  getBillRes() async {
    try {
      statusRequest = StatusRequest.loading;
      responset = await getBill();
      print("=========x> ${statusRequest}");
      statusRequest = handlingData(responset);
      if (statusRequest == StatusRequest.success) {
        print("xxxxxxxxx> ${responset} ");

        billModel = await BillModel.fromJson(responset);
        len = billModel!.data!.length;
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
    await getBillRes();
    // len = orderModel!.data!.length;
    load = false;
    update();
    super.onInit();
  }
}
