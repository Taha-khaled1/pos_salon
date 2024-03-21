import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/account_url.dart';

class EmailVerificationScreen extends StatefulWidget {
  final PageController pageController;

  const EmailVerificationScreen({
    super.key,
    required this.pageController,
  });

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  List<String> code = ['', '', '', ''];
  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(5, (index) => FocusNode());
    controllers = List.generate(5, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void onCodeChanged(int index, String value) {
    if (value.isEmpty) {
      // When backspace is pressed, move focus to the previous square
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    } else {
      code[index] = value;
      // When a digit is entered, move focus to the next square
      if (index < 4) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    }
    setState(() {});
  }

  void onVerifyPressed() {
    String enteredCode = code.join('');
    print('Entered code: $enteredCode');
  }

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
                InkWell(
                    onTap: () {
                      widget.pageController.jumpToPage(1);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorManager.kPrimary,
                    )),
                Spacer(),
                Text(
                  'email verification',
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
                    'Copy the verification code in your email application to verify this account recovery.',
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
                  // verification code boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      5,
                          (index) => SizedBox(
                        width: 55.w,
                        height: 55.h,
                        child: TextField(
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          onChanged: (value) => onCodeChanged(index, value),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: TextStyle(fontSize: 20.sp),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5.h
                            ),
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // resend code button
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        widget.pageController.jumpToPage(1);
                      },
                      child: Text(
                        'resend code',
                        style: TextStyle(
                          color: Color(0xff78CFCF),
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),


                  //space
                  SizedBox(
                    height: 50.h,
                  ),
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
                          widget.pageController.jumpToPage(3);
                        },
                        child: Text(
                          'submit verification',
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
      ),
    );
  }
}
