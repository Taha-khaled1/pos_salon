import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_text_field.dart';
import '../../../src/account_url.dart';
import '../../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  final PageController pageController;
  const LoginScreen({super.key, required this.pageController,});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 30.h,
        left: 50.w,
        right: 50.w,
        bottom: 30.h,
      ),
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
                SizedBox(height: 10.h),
                // forgot password button
                InkWell(
                  onTap: () {
                    widget.pageController.jumpToPage(1);
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: ColorManager.kPrimary,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
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
    );
  }
}
