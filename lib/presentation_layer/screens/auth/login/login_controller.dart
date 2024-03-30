import 'package:get/get.dart';
import 'package:pos_animal/application_layer/utils/handling.dart';
import 'package:pos_animal/application_layer/utils/statusrequst.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/main.dart';
import 'package:pos_animal/presentation_layer/resources/msnge_api.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:pos_animal/presentation_layer/src/show_toast.dart';
import 'package:pos_animal/presentation_layer/utils/NotificationHandler.dart';

class LoginController extends GetxController {
  bool isload = false;
  LoginController();
  String? email, password;
  StatusRequest statusRequest = StatusRequest.none;
  Future<void> login() async {
    try {
      isload = true;
      update();
      statusRequest = StatusRequest.loading;
      final response = await loginRespon(pass: password!, email: email!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        final message = response['message'];
        final status = response['code'];
        final data = response['data'];
        if (status == 200 || status == 201) {
          saveUser(data);
          Get.offAll(() => HomeScreen());
          showToast(message);
        }
        print("object");
        showToast(message);
        isload = false;
      }
    } catch (e) {
      print("====================$e==========================");
      showToast("$e"); //
    }
    isload = false;
    update();
  }

  bool isPassShow = true;
  changeVisibility() {
    isPassShow = !isPassShow;
    update(); // Notify listeners to rebuild widgets
  }
}

loginRespon({
  required String pass,
  required String email,
}) async {
  Curd curd = Curd();
  // NotificationHandler notificationHandler = NotificationHandler();

  // String fcm = await notificationHandler.userToken();
  var respons = await curd.postrequest(
    "https://salon-app.nanots.ae/api/v1/user/auth/login",
    {"phone": email, "password": pass, "device_token": "fcm"},
    encode: true,
    myheadersres: curd.myheaders3,
  );
  return respons;
}

saveUser(dynamic data) {
  print(data['user']['name']);
  sharedPreferences.setInt('id', data['user']['id']);
  sharedPreferences.setString('name', data['user']['name'] ?? "");
  sharedPreferences.setString('email', data['user']['email']);
  sharedPreferences.setString('phone', data['user']['phone'] ?? "");
  sharedPreferences.setString('address', data['user']['address'] ?? "");
  sharedPreferences.setString(
      'profile_image', data['user']['profile_image'] ?? "");
  sharedPreferences.setString('token', data['access_token']);
}
