import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  String? phone, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('LoginScreen'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 619,
            height: 920,
            padding: const EdgeInsets.only(
              top: 54,
              left: 90,
              right: 90,
              bottom: 72,
            ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 144.09,
                  height: 171,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/salony logo post 4.png"),
                      fit: BoxFit.contain,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(height: 52),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 106,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Login form',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF18181B),
                                  fontSize: 28,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.05,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Lorem Ipsum has been the industry standard dummy text ever since.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF828487),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  // height: 0.09,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        height: 215,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 85,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'phone',
                                      style: TextStyle(
                                        color: Color(0xFF828487),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0.12,
                                      ),
                                    ),
                                  ),
                                  CustomTextfield(
                                    validator: (value) {
                                      return null;
                                    },
                                    onSaved: (value) {
                                      return null;
                                    },
                                    onChanged: (p0) {
                                      phone = p0.toString();
                                    },
                                    titel: "Enter phone",
                                    width: 500,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              height: 85,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Password',
                                      style: TextStyle(
                                        color: Color(0xFF828487),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0.12,
                                      ),
                                    ),
                                  ),
                                  CustomTextfield(
                                    obscureText: true,
                                    onChanged: (p0) {
                                      password = p0.toString();
                                    },
                                    validator: (value) {
                                      return null;
                                    },
                                    onSaved: (value) {
                                      return null;
                                    },
                                    titel: "Enter password",
                                    width: 500,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Color(0xFF0E5D6A),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0.10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          if (phone != null && password != null) {
                            login(phone!, password!);
                          } else {
                            showDilog(
                              context,
                              "Please enter data",
                              type: QuickAlertType.info,
                              onConfirmBtnTap: () {
                                Get.back();
                              },
                            );
                          }
                        },
                        child: Container(
                          width: 443,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 48,
                                  padding: const EdgeInsets.all(12),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    gradient: RadialGradient(
                                      center: Alignment(-0.04, 0.92),
                                      radius: 0,
                                      colors: [
                                        Color(0xFF12798A),
                                        Color(0xFF0E5D6A)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(58),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 0.09,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
