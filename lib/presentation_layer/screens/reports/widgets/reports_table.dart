import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/resources/color_manager.dart';

import '../../../components/custom_elevated_button.dart';
import '../../../resources/styles_manager.dart';

class ReportsTable extends StatefulWidget {
  const ReportsTable({super.key});

  @override
  State<ReportsTable> createState() => _ReportsTableState();
}

class _ReportsTableState extends State<ReportsTable> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffFAFAFA),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text(
                  "Top Members",
                  style:
                  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                      height: 40.h,
                      width: 142.w,
                      backgroundColor: Colors.white,
                      borderColor: ColorManager.kPrimary,

                      icon: Icons.local_printshop_outlined, text: 'Re-print', onPressed: () {},
                      textSize: 16.sp,
                      textColor: ColorManager.kPrimary,
                      iconSize: 18.h,
                      iconColor: ColorManager.kPrimary,
                      borderRadius: 30,

                    ),
                    SizedBox(width: 10.w,),
                    CustomElevatedButton(
                      height: 40.h,
                      width: 142.w,
                      backgroundColor: ColorManager.kPrimary,
                      borderColor: ColorManager.kPrimary,
                      text: 'Download', onPressed: () {},
                      textSize: 16.sp,
                      textColor: Colors.white,
                      borderRadius: 30,
                      iconWidget: Image.asset('assets/icons/xl_file.png',height: 18.h,),
                      iconSize: 18.h,

                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: ColorManager.kPrimary,
          ),
          DataTable(
            headingTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
            columnSpacing: 110.w,
            dataTextStyle: TextStyle(fontSize: 18.0.h, color: Colors.black),
            columns: [
              DataColumn(
                label: SizedBox(
                  width: 100.w,
                  child: Row(
                    children: [
                      Text(
                        'Name',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: 18.h,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Image.asset(
                        'assets/icons/mobile_data.png',
                        height: 15.h,
                      )
                    ],
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: 140.w,
                  child: Text(
                    'Email',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 18.h,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: 140.w,
                  child: Text(
                    'Phone Number',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 18.h,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Country',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.black,
                    fontSize: 18.h,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'City',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.black,
                    fontSize: 18.h,
                  ),
                ),
              ),
              DataColumn(
                label: Image.asset('assets/icons/row_menu.png',width: 15.w,),
              ),
            ],
            rows: [
              for (int i = 0; i < 10; i++)
                DataRow(
                  cells: [
                    DataCell(Text(
                      'Ahmed',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                    DataCell(Text(
                      'ahmedmo@gmail.com',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                    DataCell(Text(
                      '01251645983',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                    DataCell(
                      Text(
                        'Egypt',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        'Alexandria',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    DataCell(Image.asset('assets/icons/row_menu.png',width: 15.w,)),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
