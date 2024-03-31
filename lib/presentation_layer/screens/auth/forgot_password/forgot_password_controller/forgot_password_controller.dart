import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/presentation_layer/screens/auth/forgot_password/email_verificatin_screen.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import 'package:pos_animal/presentation_layer/src/show_toast.dart';

import '../../../../../application_layer/utils/statusrequst.dart';

class ForgetPassController extends GetxController {
  ForgetPassController();
  bool isload = false;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  var formKey = GlobalKey<FormState>();

  Future<void> ForgetPass(PageController pageController) async {
    try {
      isload = true;
      update();
      statusRequest = StatusRequest.loading;
      final response = await ForgetPassRespon(email: email!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        final message = response['message'];
        final status = response['code'];
        final data = response['data'];
        if (status == 200 || status == 201) {
          pageController.jumpToPage(2);
          sharedPreferences.setString("email_c", email!);
          showToast(message);
        }
        print("object");
        showToast(message);
      }
    } catch (e) {
      print("====================$e==========================");
      showToast("$e"); // AppStrings.erorr_massg.tr
    }
    isload = false;
    update();
  }
}

ForgetPassRespon({
  required String email,
}) async {
  Curd curd = Curd();
  // NotificationHandler notificationHandler = NotificationHandler();
  // String fcm = await notificationHandler.userToken();
  var respons = await curd.postrequest(
    'https://salon-app.nanots.ae/api/v1/user/auth/send-otp',
    {"phone": email},
    encode: true,
    myheadersres: curd.myheaders3,
  );
  return respons;
}
