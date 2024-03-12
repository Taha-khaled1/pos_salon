import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/custom_butten.dart';
import '../../components/custom_elevated_button.dart';
import '../../resources/color_manager.dart';

class BillDetailsScreen extends StatefulWidget {
  const BillDetailsScreen({super.key});

  @override
  State<BillDetailsScreen> createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/back_arrow_circle.png',
                  height: 25.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Bills",
                  style: TextStyle(
                      color: ColorManager.kPrimary,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  width: 850.w,
                  padding: EdgeInsets.only(top: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffFAFAFA),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Bills Details",
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(
                        color: ColorManager.kPrimary,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Service invoice",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: ColorManager.kPrimary,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffE1FFDC),
                                  ),
                                  child: Text(
                                    'paid',
                                    style:
                                        TextStyle(color: Color(0xff07A104)),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Employee:",
                                  style: TextStyle(
                                      color: Color(0xff555555),
                                      fontSize: 16.sp),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Invoice ID:",
                                  style: TextStyle(
                                      color: Color(0xff555555),
                                      fontSize: 16.sp),
                                ),
                                Text(
                                  "  INV-098",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Spacer(),
                                Text(
                                  "Masud Rana",
                                  style: TextStyle(
                                      color: Color(0xff555555),
                                      fontSize: 16.sp),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 20.w),
                              decoration:
                                  BoxDecoration(color: Color(0xffE5FFF9)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "INVOICE DETAILS",
                                        style: TextStyle(
                                            color: Color(0xff555555),
                                            fontSize: 18.sp),
                                      ),
                                      Spacer(),
                                      Text(
                                        "BILLED TO",
                                        style: TextStyle(
                                            color: Color(0xff555555),
                                            fontSize: 18.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "INV-10839",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Ayat soliman",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Service : Hair cut ",
                                        style: TextStyle(
                                            color: Color(0xff555555),
                                            fontSize: 18.sp),
                                      ),
                                      Spacer(),
                                      Text(
                                        "+12 3456 7890",
                                        style: TextStyle(
                                            color: Color(0xff555555),
                                            fontSize: 18.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Date: August 9, 2022 ",
                                        style: TextStyle(
                                            color: Color(0xff555555),
                                            fontSize: 18.sp),
                                      ),
                                      Spacer(),
                                      Text(
                                        "New customer",
                                        style: TextStyle(
                                            color: Color(0xff555555),
                                            fontSize: 18.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Time: 5:45 PM",
                                        style: TextStyle(
                                            color: Color(0xff555555),
                                            fontSize: 18.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "Service",
                                    style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 18.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 18.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "Amount",
                                    style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 18.sp),
                                  ),
                                ),
                                Text(
                                  "total",
                                  style: TextStyle(
                                      color: Color(0xff555555),
                                      fontSize: 18.sp),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "Service Name",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 18.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "\$100",
                                    style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 18.sp),
                                  ),
                                ),
                                Text(
                                  "\$200",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "Service Name",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 18.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    "\$100",
                                    style: TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 18.sp),
                                  ),
                                ),
                                Text(
                                  "\$200",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Color(0xffE2E2E2),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            )),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                            ),
                            SizedBox(
                              width: 120.w,
                            ),
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                "Total Amount:",
                                style: TextStyle(
                                    color: Color(0xff555555),
                                    fontSize: 18.sp),
                              ),
                            ),
                            Text(
                              "\$400",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Container(
                      width: 400.w,
                      padding: EdgeInsets.only(top: 20.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffFAFAFA),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "Client info",
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Divider(
                            color: ColorManager.kPrimary,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 20.w),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/gallery.png',
                                          height: 40.h,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          "Ayat soliman",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/phone.png',
                                          height: 25.h,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          "+12 3456 7890",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Color(0xff000000)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/email.png',
                                          height: 25.h,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          "Exampel@gmail.com",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Color(0xff000000)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/location.png',
                                          height: 25.h,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          "exampel, exampel, 1234",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Color(0xff000000)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    CustomButton(
                                      backgroundColor: ColorManager.beige,
                                      text: "view customer",
                                      press: () {},
                                      colorText: ColorManager.kPrimary,
                                      width: 300.w,
                                      height: 50.h,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      rectangel: 0,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    CustomElevatedButton(
                      height: 50.h,
                      width: 310.w,
                      backgroundColor: ColorManager.kPrimary,
                      borderColor: ColorManager.kPrimary,
                      text: 'Download', onPressed: () {},
                      textSize: 16.sp,
                      textColor: Colors.white,
                      borderRadius: 30,
                      iconWidget: Image.asset('assets/icons/xl_file.png',height: 18.h,),
                      iconSize: 18.h,

                    ),
                    SizedBox(height: 20.h,),
                    CustomElevatedButton(
                      height: 50.h,
                      width: 310.w,
                      backgroundColor: Colors.white,
                      borderColor: ColorManager.kPrimary,

                      icon: Icons.local_printshop_outlined, text: 'Re-print', onPressed: () {},
                      textSize: 16.sp,
                      textColor: ColorManager.kPrimary,
                      iconSize: 18.h,
                      iconColor: ColorManager.kPrimary,
                      borderRadius: 30,

                    ),

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
