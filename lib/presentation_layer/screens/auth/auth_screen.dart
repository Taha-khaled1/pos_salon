import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pos_animal/presentation_layer/screens/auth/forgot_password/email_verificatin_screen.dart';
import 'package:pos_animal/presentation_layer/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:pos_animal/presentation_layer/screens/auth/forgot_password/new_password_screen.dart';
import 'package:pos_animal/presentation_layer/screens/auth/login/login_screen.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Future<void> login(String phone, String password) async {
    try {
      print('fffffffffffffffffffffffffffffffffffffffffff');
      // Make a post request with the email and password
      final response = await http.post(
        Uri.parse('https://salon-app.nanots.ae/api/v1/user/auth/login'),
        body: {
          'phone': phone,
          'password': password,
          "user_type": "customer",
          "device_token": "Device Token From Firebase"
        },
      );

      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        print(response.body);
        if (message == 'Incorrect Data') {
          showDilog(
            context,
            AppStrings.invalid_credentials.tr,
            type: QuickAlertType.info,
            onConfirmBtnTap: () {
              Get.back();
            },
          );
        } else {
          final data = jsonDecode(response.body)['data'];

          sharedPreferences.setInt('id', data['client']['id']);
          sharedPreferences.setString('name', data['client']['name'] ?? "");
          sharedPreferences.setString('email', data['client']['email']);
          sharedPreferences.setString('phone', data['client']['phone'] ?? "");
          sharedPreferences.setString(
              'address', data['client']['address'] ?? "");
          sharedPreferences.setString(
              'profile_image', data['client']['profile_image'] ?? "");
          sharedPreferences.setString('token', data['access_token']);
          Get.offAll(() => HomeScreen());
          print("==============================================");
        }
      } else {
        print('zzzzzzzzzzzzzzzzzzzzzzzzzz');
        showDilog(
          context,
          AppStrings.invalid_credentials.tr,
          type: QuickAlertType.info,
          onConfirmBtnTap: () {
            Get.back();
          },
        );
      }
    } catch (e) {
      print("error : $e");
      showDilog(
        context,
        AppStrings.invalid_credentials.tr,
        type: QuickAlertType.info,
        onConfirmBtnTap: () {
          Get.back();
        },
      );
    }
  }

  String? userName, password;

  late int select = 0;
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: select, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: ColorManager.kPrimary,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset("assets/images/img_1.png"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 50.h),
            width: 550.w,
            height: 920.h,

            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFF0FCFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x1419191C),
                  blurRadius: 64,
                  offset: Offset(0, 24),
                  spreadRadius: -16,
                )
              ],
            ),
            child:PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                LoginScreen(pageController: controller),
                ForgotPasswordScreen(pageController: controller),
                EmailVerificationScreen(pageController: controller),
                NewPasswordScreen(pageController: controller)

              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showDilog(BuildContext context, String massg,
    {QuickAlertType? type, bool? butn, void Function()? onConfirmBtnTap}) {
  QuickAlert.show(
    context: context,
    type: type ?? QuickAlertType.success,
    text: massg,
    confirmBtnText: 'موافق',
    cancelBtnText: 'No',
    confirmBtnColor: Colors.green,
    onConfirmBtnTap: onConfirmBtnTap ??
        () {
          if (butn == true) {
            Get.back();
            Future.delayed(Duration(milliseconds: 100));
            Get.back();
          } else {
            Get.back();
          }
        },
  );
}
