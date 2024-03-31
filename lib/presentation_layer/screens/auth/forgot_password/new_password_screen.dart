import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/application_layer/utils/valid.dart';
import 'package:pos_animal/presentation_layer/screens/auth/forgot_password/reset_password_controller.dart';
import '../../../components/custom_text_field.dart';
import '../../../src/account_url.dart';

class NewPasswordScreen extends StatefulWidget {
  final PageController pageController;
  const NewPasswordScreen({
    super.key,
    required this.pageController,
  });

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 30.h,
        left: 20.w,
        right: 20.w,
        bottom: 30.h,
      ),
      child: GetBuilder<ResetPassController>(
          init: ResetPassController(),
          builder: (_) {
            return Form(
              key: _.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            widget.pageController.jumpToPage(0);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: ColorManager.kPrimary,
                          )),
                      Spacer(),
                      Text(
                        'Set New Password',
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Text(
                          'Enter your new password below and check the hint while setting it.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 20.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            // height: 0.09,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        // new password text field
                        CustomTextfield(
                          validator: (p0) {
                            validInput(p0.toString(), 8, 100, "password");
                          },
                          obscureText: _.isPassShow,
                          onIconTap: () {
                            _..changeVisibility();
                          },
                          suffixIcon: _.isPassShow
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onSaved: (p0) {
                            _.pass = p0.toString();
                          },
                          titel: "new password",
                          horizontalPadding: 20.w,
                          width: 600.w,
                          icon: Icons.lock,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        CustomTextfield(
                          validator: (p0) {
                            validInput(p0.toString(), 8, 100, "password");
                          },
                          obscureText: _.isPassShow2,
                          onIconTap: () {
                            _..changeVisibility2();
                          },
                          suffixIcon: _.isPassShow2
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onSaved: (p0) {
                            _.newpass = p0.toString();
                          },
                          titel: "confirm password",
                          horizontalPadding: 20.w,
                          width: 600.w,
                          icon: Icons.lock,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        // submit button
                        _.isload
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(
                                height: 50.h,
                                width: 600.w,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorManager.kPrimary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(45.0),
                                        )),
                                    onPressed: () {
                                      if (_.formKey.currentState!.validate()) {
                                        _.formKey.currentState!.save();
                                        _.resetPass();
                                      }
                                      // widget.pageController.jumpToPage(2);
                                    },
                                    child: Text(
                                      'submit password',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
