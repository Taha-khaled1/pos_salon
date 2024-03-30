import 'package:get/get.dart';
import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/data_layer/models/customer.dart';

class CustomerController extends GetxController {
  late StatusRequest statusRequest;
  var responset;
  int len = 0;
  bool load = true;
  dynamic getCustomer() async {
    Curd curd = Curd();
    var respons = await curd.getrequest(
      "https://salon-app.nanots.ae/api/v1/user/customer",
      myheadersres: curd.myheaders3,
    );

    return respons;
  }

  CustomerModel? customerModel;
  getCustomerRes() async {
    try {
      statusRequest = StatusRequest.loading;
      responset = await getCustomer();
      print("=========x> ${statusRequest}");
      statusRequest = handlingData(responset);
      if (statusRequest == StatusRequest.success) {
        print("xxxxxxxxx> ${responset} ");

        customerModel = await CustomerModel.fromJson(responset);
        len = customerModel!.data!.length;
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
    await getCustomerRes();
    // len = orderModel!.data!.length;
    load = false;
    update();
    super.onInit();
  }
}
