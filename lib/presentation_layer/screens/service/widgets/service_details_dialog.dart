import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/data_layer/database/sqlflite.dart';
import 'package:pos_animal/main.dart';
import 'package:pos_animal/presentation_layer/components/custom_butten.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:pos_animal/presentation_layer/screens/service/widgets/right_side_widget.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';
import 'package:pos_animal/presentation_layer/src/show_toast.dart';

import '../../../components/custom_text_field.dart';
import '../../../resources/color_manager.dart';

void showDetailsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ShowDialogService();
    },
  );
}

class ShowDialogService extends StatefulWidget {
  const ShowDialogService({super.key});

  @override
  State<ShowDialogService> createState() => _ShowDialogServiceState();
}

class _ShowDialogServiceState extends State<ShowDialogService> {
  DatabaseHelper dbHelper = DatabaseHelper();
  String? note, emp_name;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10.h),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Text(
                    "Add Service details",
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 25.r,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 100.h,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color: Color(0xffF8F9FD),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //image
                  Container(
                    width: 75.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            sharedPreferences.getString("s_image") ?? "",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 26.h,
                          child: Text(
                            sharedPreferences.getString("s_name") ?? "",
                            style: TextStyle(
                              fontSize: 18.h,
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
                            '\$ ${sharedPreferences.getInt("s_price") ?? ""}',
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
                  //   padding: EdgeInsets.symmetric(vertical: 10.h),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         height: 35.h,
                  //         width: 35.w,
                  //         decoration: BoxDecoration(
                  //             shape: BoxShape.circle, color: Color(0xffE4E4E4)),
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
                  //             shape: BoxShape.circle, color: Color(0xff19191C)),
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
            ),
            SizedBox(
              height: 5.h,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.w),
            //   child: Column(
            //     children: [
            //       Align(
            //         alignment: Alignment.topLeft,
            //         child: Text(
            //           "Additional",
            //           style: TextStyle(
            //               fontSize: 18.sp, fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //       SizedBox(
            //         height: 5.h,
            //       ),
            //       Row(
            //         children: [
            //           //image
            //           Container(
            //             width: 45.w,
            //             height: 50.h,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                   image: NetworkImage(
            //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTEnb4bQKUe6UZLmUIKn1u5BqsTmyTA0S8TA&usqp=CAU',
            //                   ),
            //                   fit: BoxFit.cover,
            //                 )),
            //           ),
            //           SizedBox(
            //             width: 10.w,
            //           ),
            //           //description
            //           SizedBox(
            //             height: 80.h,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 SizedBox(
            //                   height: 26.h,
            //                   child: Text(
            //                     'Mask',
            //                     style: TextStyle(
            //                       fontSize: 18.h,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 26.h,
            //                   child: Text(
            //                     '\$140',
            //                     style: TextStyle(
            //                       fontSize: 18.h,
            //                       color: ColorManager.kPrimary,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Spacer(),
            //           //change amount
            //           Container(
            //             alignment: Alignment.bottomLeft,
            //             padding: EdgeInsets.symmetric(vertical: 10.h),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   height: 35.h,
            //                   width: 35.w,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       color: Color(0xffE4E4E4)),
            //                   alignment: Alignment.center,
            //                   child: Icon(
            //                     Icons.remove,
            //                     size: 20.w,
            //                     color: Colors.grey,
            //                   ),
            //                 ),
            //                 SizedBox(width: 10.w),
            //                 Text(
            //                   '1',
            //                   style: TextStyle(
            //                     fontSize: 18.sp,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 SizedBox(width: 10.w),
            //                 Container(
            //                   height: 35.h,
            //                   width: 35.w,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       color: Color(0xff19191C)),
            //                   alignment: Alignment.center,
            //                   child: Icon(
            //                     Icons.add,
            //                     size: 20.w,
            //                     color: Colors.grey,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           //image
            //           Container(
            //             width: 45.w,
            //             height: 50.h,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                   image: NetworkImage(
            //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTEnb4bQKUe6UZLmUIKn1u5BqsTmyTA0S8TA&usqp=CAU',
            //                   ),
            //                   fit: BoxFit.cover,
            //                 )),
            //           ),
            //           SizedBox(
            //             width: 10.w,
            //           ),
            //           //description
            //           SizedBox(
            //             height: 80.h,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 SizedBox(
            //                   height: 26.h,
            //                   child: Text(
            //                     'Mask',
            //                     style: TextStyle(
            //                       fontSize: 18.h,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 26.h,
            //                   child: Text(
            //                     '\$140',
            //                     style: TextStyle(
            //                       fontSize: 18.h,
            //                       color: ColorManager.kPrimary,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Spacer(),
            //           //change amount
            //           Container(
            //             alignment: Alignment.bottomLeft,
            //             padding: EdgeInsets.symmetric(vertical: 10.h),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   height: 35.h,
            //                   width: 35.w,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       color: Color(0xffE4E4E4)),
            //                   alignment: Alignment.center,
            //                   child: Icon(
            //                     Icons.remove,
            //                     size: 20.w,
            //                     color: Colors.grey,
            //                   ),
            //                 ),
            //                 SizedBox(width: 10.w),
            //                 Text(
            //                   '1',
            //                   style: TextStyle(
            //                     fontSize: 18.sp,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 SizedBox(width: 10.w),
            //                 Container(
            //                   height: 35.h,
            //                   width: 35.w,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       color: Color(0xff19191C)),
            //                   alignment: Alignment.center,
            //                   child: Icon(
            //                     Icons.add,
            //                     size: 20.w,
            //                     color: Colors.grey,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           //image
            //           Container(
            //             width: 45.w,
            //             height: 50.h,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                   image: NetworkImage(
            //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTEnb4bQKUe6UZLmUIKn1u5BqsTmyTA0S8TA&usqp=CAU',
            //                   ),
            //                   fit: BoxFit.cover,
            //                 )),
            //           ),
            //           SizedBox(
            //             width: 10.w,
            //           ),
            //           //description
            //           SizedBox(
            //             height: 80.h,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 SizedBox(
            //                   height: 26.h,
            //                   child: Text(
            //                     'Mask',
            //                     style: TextStyle(
            //                       fontSize: 18.h,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 26.h,
            //                   child: Text(
            //                     '\$140',
            //                     style: TextStyle(
            //                       fontSize: 18.h,
            //                       color: ColorManager.kPrimary,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Spacer(),
            //           //change amount
            //           Container(
            //             alignment: Alignment.bottomLeft,
            //             padding: EdgeInsets.symmetric(vertical: 10.h),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   height: 35.h,
            //                   width: 35.w,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       color: Color(0xffE4E4E4)),
            //                   alignment: Alignment.center,
            //                   child: Icon(
            //                     Icons.remove,
            //                     size: 20.w,
            //                     color: Colors.grey,
            //                   ),
            //                 ),
            //                 SizedBox(width: 10.w),
            //                 Text(
            //                   '1',
            //                   style: TextStyle(
            //                     fontSize: 18.sp,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 SizedBox(width: 10.w),
            //                 Container(
            //                   height: 35.h,
            //                   width: 35.w,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       color: Color(0xff19191C)),
            //                   alignment: Alignment.center,
            //                   child: Icon(
            //                     Icons.add,
            //                     size: 20.w,
            //                     color: Colors.grey,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Employee name",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 400.w,
                    child: CustomTextfield(
                      borderRadius: 5,
                      width: double.infinity,
                      horizontalPadding: 10.w,
                      height: 45.h,
                      validator: (search) {
                        return null;
                      },
                      onSaved: (search) {
                        return null;
                      },
                      onChanged: (p0) {
                        emp_name = p0;
                      },
                      titel: "Choose Name",
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add note",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 80.h,
                    width: 400.w,
                    child: CustomTextfield(
                      borderRadius: 5,
                      width: double.infinity,
                      horizontalPadding: 10.w,
                      height: 80.h,
                      maxLines: 4,
                      validator: (search) {
                        return null;
                      },
                      onSaved: (search) {
                        return null;
                      },
                      onChanged: (p0) {
                        note = p0;
                      },
                      titel: "Type your note here..",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      // Column(
                      //   children: [
                      //     Text(
                      //       'Total',
                      //       style: TextStyle(
                      //           color: Color(0xff828487), fontSize: 16.sp),
                      //     ),
                      //     Text(
                      //       '\$ 26.52',
                      //       style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 18.sp,
                      //           fontWeight: FontWeight.bold),
                      //     )
                      //   ],
                      // ),
                      Spacer(),
                      SizedBox(
                        height: 40.h,
                        width: 250.w,
                        child: CustomButton(
                          backgroundColor: ColorManager.kPrimary,
                          text: "Add to order",
                          press: () async {
                            Service newService = Service(
                              employeeName: emp_name ?? 'John Doe',
                              image: sharedPreferences.getString("image") ??
                                  'image_url',
                              title: sharedPreferences.getString("name") ??
                                  'Service Title',
                              price: sharedPreferences
                                  .getInt("s_price")
                                  .toString(),
                            );
                            services.add(newService);
                            int insertedId =
                                await dbHelper.insertService(newService);
                            print('Inserted service ID: $insertedId');
                            showToast("Service added successfully");
                            setState(() {});
                            Navigator.pop(context);
                            Get.offAll(() => HomeScreen());
                          },
                          height: 40.h,
                          width: 250.w,
                          fontSize: 16.sp,
                          rectangel: 30,
                        ),
                      )
                    ],
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
