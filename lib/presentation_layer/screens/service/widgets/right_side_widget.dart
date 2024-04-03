import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/data_layer/database/sqlflite.dart';
import 'package:http/http.dart' as http;
import 'package:pos_animal/presentation_layer/src/show_toast.dart';
import 'dart:convert';
import '../../../components/custom_butten.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/dash_line.dart';
import '../../../resources/color_manager.dart';

List<Service> services = [];

class RightSideWidget extends StatefulWidget {
  RightSideWidget({super.key, required this.controller});
  final PageController controller;
  @override
  State<RightSideWidget> createState() => _RightSideWidgetState();
}

class _RightSideWidgetState extends State<RightSideWidget> {
  DatabaseHelper dbHelper = DatabaseHelper();
  int price = 0;
  int discount = 0;
  String selectedOption = 'Pay';
  int customernumber = 0;
  int indvidual = 0;
  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    loadServices();
  }

  Future<void> loadServices() async {
    services = await dbHelper.getServices();
    print('All services:');
    services.forEach((service) {
      price += int.parse(service.price!);
      print(
          'ID: ${service.id}, Employee Name: ${service.employeeName}, Title: ${service.title}');
      // dbHelper.deleteService(service.id!);
    });
    setState(() {}); // Update the UI after loading services
  }

  String code = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      color: Color(0xffF5F5F5),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //customer information widget
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                children: [
                  //toggle switch
                  Container(
                    width: 310.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: ColorManager.feathery,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = 'Pay';
                            });
                          },
                          child: Container(
                            width: 150.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: selectedOption == 'Pay'
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Pay',
                                style: TextStyle(
                                    color: selectedOption == 'Pay'
                                        ? Colors.black
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.sp),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = 'Reservation';
                            });
                          },
                          child: Container(
                            width: 150.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: selectedOption == 'Reservation'
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Reservation',
                                style: TextStyle(
                                    color: selectedOption == 'Reservation'
                                        ? Colors.black
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Customer Information",
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // customer Number
                  CustomTextfield(
                    validator: (text) {
                      return null;
                    },
                    onSaved: (text) {
                      return null;
                    },
                    onChanged: (p0) {
                      customernumber = int.parse(p0);
                    },
                    titel: "Customer Number",
                    width: 310.w,
                    height: 50.h,
                    verticalPadding: 0,
                    horizontalPadding: 10.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Select time
                  InkWell(
                    onTap: () {
                      widget.controller.jumpToPage(8);
                    },
                    child: CustomTextfield(
                      enabled: false,
                      validator: (text) {
                        return null;
                      },
                      onSaved: (text) {
                        return null;
                      },
                      titel: "Select time",
                      width: 310.w,
                      height: 50.h,
                      verticalPadding: -2.h,
                      horizontalPadding: 10.w,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: ColorManager.kPrimary,
                        size: 20.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    rectangel: 30,
                    width: 310.w,
                    height: 50.h,
                    backgroundColor: ColorManager.beige,
                    fontSize: 17.sp,
                    text: "Add note",
                    colorText: ColorManager.kPrimary,
                    press: () {},
                  ),
                ],
              ),
            ),
            Divider(),
            // service details
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Service details",
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 180.h,
                    child: ListView.builder(
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            width: 310.w,
                            height: 110.h,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    //image
                                    Container(
                                      width: 75.w,
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              services[index].image ?? "",
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    //description
                                    SizedBox(
                                      height: 80.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 26.h,
                                            child: Text(
                                              services[index].title ?? "",
                                              style: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          SizedBox(
                                            height: 23.h,
                                            child: Text(
                                              "price",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.h,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 26.h,
                                            child: Text(
                                              '\$ ${services[index].price ?? ""}',
                                              style: TextStyle(
                                                fontSize: 18.h,
                                                color: ColorManager.kPrimary,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    //change amount
                                    // Container(
                                    //   alignment: Alignment.bottomLeft,
                                    //   padding:
                                    //       EdgeInsets.symmetric(vertical: 10.h),
                                    //   child: Row(
                                    //     children: [
                                    //       Container(
                                    //         height: 35.h,
                                    //         width: 35.w,
                                    //         decoration: BoxDecoration(
                                    //             shape: BoxShape.circle,
                                    //             color: Color(0xffE4E4E4)),
                                    //         alignment: Alignment.center,
                                    //         child: Icon(
                                    //           Icons.remove,
                                    //           size: 20.w,
                                    //           color: Colors.grey,
                                    //         ),
                                    //       ),
                                    //       SizedBox(width: 10.w),
                                    //       Text(
                                    //         '1',
                                    //         style: TextStyle(
                                    //           fontSize: 18.sp,
                                    //           fontWeight: FontWeight.bold,
                                    //         ),
                                    //       ),
                                    //       SizedBox(width: 10.w),
                                    //       Container(
                                    //         height: 35.h,
                                    //         width: 35.w,
                                    //         decoration: BoxDecoration(
                                    //             shape: BoxShape.circle,
                                    //             color: Color(0xff19191C)),
                                    //         alignment: Alignment.center,
                                    //         child: Icon(
                                    //           Icons.add,
                                    //           size: 20.w,
                                    //           color: Colors.grey,
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Divider(
                                  height: 20.h,
                                )
                              ],
                            ),
                          );
                        }),
                  )
                  // service card
                ],
              ),
            ),
            Container(
              height: 375.h,
              decoration: BoxDecoration(
                  color: ColorManager.feathery,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Promo code",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    children: [
                      CustomTextfield(
                        validator: (text) {
                          return null;
                        },
                        onSaved: (text) {
                          return null;
                        },
                        onChanged: (p0) {
                          code = p0.toString();
                        },
                        titel: "Promo code",
                        width: 220.w,
                        height: 50.h,
                        horizontalPadding: 10.w,
                        borderRadius: 10,
                        verticalPadding: 0,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                          height: 50.h,
                          width: 100.w,
                          child: CustomButton(
                            backgroundColor: ColorManager.beige,
                            text: "Apply",
                            press: () async {
                              Curd curd = Curd();
                              // API endpoint URL
                              String url =
                                  'https://salon-app.nanots.ae/api/v1/user/apply-coupon';

                              // Request body
                              Map<String, String> body = {
                                'code': code,
                              };

                              try {
                                // Make POST request
                                http.Response response = await http.post(
                                  Uri.parse(url),
                                  body: json.encode(body),
                                  headers: curd.myheaders3,
                                );
                                var responser = jsonDecode(response.body);
                                // Check status code
                                if (response.statusCode == 200) {
                                  // Successful request
                                  print('Coupon applied successfully!');
                                  print('Response body: ${response.body}');
                                  int percentage = int.parse(
                                      responser['data']['discount_percentage']);
                                  price -= (price * percentage) ~/ 100;
                                  discount += (price * percentage) ~/ 100;
                                  showToast('Coupon applied successfully!');
                                } else {
                                  // Request failed

                                  print('Failed to apply coupon. $responser');
                                  print('Status code: ${response.statusCode}');
                                  print('Response body: ${response.body}');
                                  showToast('Failed to apply coupon.');
                                }
                              } catch (e) {
                                // Exception occurred
                                print('Exception: $e');
                              }
                              setState(() {});
                            },
                            colorText: ColorManager.kPrimary,
                            fontSize: 14.sp,
                            rectangel: 10,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DashLine(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Sub Total",
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.grey),
                            ),
                            Spacer(),
                            Text(
                              '\$ $price',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "descount",
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.grey),
                            ),
                            Spacer(),
                            Text(
                              '\$ $discount',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                  DashLine(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          '\$ $price',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: ColorManager.kPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    backgroundColor: ColorManager.kPrimary,
                    text: "Pay Now",
                    press: () {},
                    height: 40.h,
                    width: 310.w,
                    fontSize: 16.sp,
                    rectangel: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
