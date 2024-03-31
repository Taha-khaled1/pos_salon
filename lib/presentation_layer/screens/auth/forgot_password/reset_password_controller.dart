import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/presentation_layer/screens/auth/login/login_controller.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:pos_animal/presentation_layer/src/get_packge.dart';
import 'package:pos_animal/presentation_layer/src/show_toast.dart';

import '../../../src/account_url.dart';

class ResetPassController extends GetxController {
  ResetPassController();
  String? pass, newpass;
  StatusRequest statusRequest = StatusRequest.none;
  var formKey = GlobalKey<FormState>();
  bool isload = false;
  bool isPassShow = true;
  changeVisibility() {
    isPassShow = !isPassShow;
    update(); // Notify listeners to rebuild widgets
  }

  bool isPassShow2 = true;
  changeVisibility2() {
    isPassShow2 = !isPassShow2;
    update(); // Notify listeners to rebuild widgets
  }

  Future<void> resetPass() async {
    try {
      isload = true;
      update();
      statusRequest = StatusRequest.loading;
      final response = await resetPassRespon(newpass: newpass!, pass: pass!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        final message = response['message'];
        final status = response['code'];
        final data = response['data'];
        if (status == 200 || status == 201) {
          print(data);
          saveUserReset(data);
          showToast(message);
          Get.to(() => HomeScreen());
        }
        showToast(message);
      }
    } catch (e) {
      print("====================$e==========================");
      showToast(e.toString()); // AppStrings.erorr_massg.tr
    }
    isload = false;
    update();
  }
}

resetPassRespon({
  required String pass,
  required String newpass,
}) async {
  Curd curd = Curd();
  // NotificationHandler notificationHandler = NotificationHandler();
  // String fcm = await notificationHandler.userToken();
  var respons = await curd.postrequest(
    'https://salon-app.nanots.ae/api/v1/user/auth/verify-otp',
    {
      "phone": sharedPreferences.getString("email_c").toString(),
      "otp_code": sharedPreferences.getString("otp"),
      "password": pass,
      "password_confirmation": newpass,
      "device_token": "fcm"
    },
    encode: true,
    myheadersres: curd.myheaders3,
  );
  return respons;
}
