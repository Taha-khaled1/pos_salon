import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/home_screen.dart';
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

  String? userName, password;

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
            padding: EdgeInsets.only(
              top: 30.h,
              left: 50.w,
              right: 50.w,
              bottom: 30.h,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo
                  Container(
                    width: 145.w,
                    height: 170.h,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/salony logo post 4.png"),
                        fit: BoxFit.contain,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // login form and description
                        Container(
                          height: 100.h,
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
                                    fontSize: 28.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0.05,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Lorem Ipsum has been the industry standard dummy text ever since.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF828487),
                                    fontSize: 18.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    // height: 0.09,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Username',
                                  style: TextStyle(
                                    color: Color(0xFF828487),
                                    fontSize: 16.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.12,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomTextfield(
                                icon: Icons.person_2_outlined,
                                validator: (value) {
                                  return null;
                                },
                                onSaved: (value) {
                                  return null;
                                },
                                onChanged: (userName) {
                                  setState(() {
                                    userName = userName.toString();
                                  });

                                },
                                titel: "Enter username",
                                width: 600.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        // password field
                        Container(
                          width: double.infinity,
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
                                    fontSize: 16.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.12,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomTextfield(
                                icon: Icons.lock_outline,
                                validator: (value) {
                                  return null;
                                },
                                onSaved: (value) {
                                  return null;
                                },
                                onChanged: (password) {
                                  setState(() {
                                    password = password.toString();
                                  });

                                },
                                titel: "Enter password",
                                width: 600.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        // forgot password button
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: ColorManager.kPrimary,
                                fontSize: 18.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        // login button
                        SizedBox(
                          height: 50.h,
                          width: 600.w,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.kPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45.0),
                                  )),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                                // if (userName != null && password != null) {
                                //   login(userName!, password!);
                                // } else {
                                //   showDilog(
                                //     context,
                                //     "Please enter data",
                                //     type: QuickAlertType.info,
                                //     onConfirmBtnTap: () {
                                //       Get.back();
                                //     },
                                //   );
                                // }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                        SizedBox(height: 40.h,)
                      ],
                    ),
                  ),
                ],
              ),
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
