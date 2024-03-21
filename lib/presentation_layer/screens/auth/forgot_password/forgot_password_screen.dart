import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_text_field.dart';
import '../../../src/account_url.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final PageController pageController;
  const ForgotPasswordScreen({super.key, required this.pageController,});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 30.h,
        left: 20.w,
        right: 20.w,
        bottom: 30.h,
      ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(onTap: (){
                    widget.pageController.jumpToPage(0);
                  },child: Icon(Icons.arrow_back,color: ColorManager.kPrimary,)),
                  Spacer(),
                  Text(
                    'Forgot Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorManager.kPrimary,
                      fontSize: 22.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer()
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),child: Column(children: [
                SizedBox(height: 100.h,),
                Text(
                  'Oops. It happens to the best of us. Input your email address a******z@ to fix the issue.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.black,
                    fontSize: 20.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    // height: 0.09,
                  ),
                ),
                SizedBox(height: 50.h,),
                // email text field
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Email',
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
                  icon: Icons.email_outlined,
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
                  titel: "Enter your email",
                  width: 600.w,
                ),
                SizedBox(height: 50.h,),
                // submit button
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
                     widget.pageController.jumpToPage(2);
                      },
                      child: Text(
                        'submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),

              ],),)

            ],
          ),
        ),
    );
  }
}
