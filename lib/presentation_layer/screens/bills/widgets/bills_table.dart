import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/components/custom_elevated_button.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class BillsTable extends StatefulWidget {

  late PageController controller;
   BillsTable({super.key,required this.controller});

  @override
  State<BillsTable> createState() => _BillsTableState();
}

class _BillsTableState extends State<BillsTable> {
  int selectedPeriodIndex = 0;

  void selectPeriod(int index) {
    setState(() {
      selectedPeriodIndex = index;
    });
  }

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
                  "Bills List",
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => selectPeriod(0),
                      child: Text(
                        'All',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      style: TextButton.styleFrom(
                        primary: selectedPeriodIndex == 0
                            ? ColorManager.kPrimary
                            : Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () => selectPeriod(1),
                      child: Text(
                        'Monthly',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      style: TextButton.styleFrom(
                        primary: selectedPeriodIndex == 1
                            ? ColorManager.kPrimary
                            : Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () => selectPeriod(2),
                      child: Text(
                        'Weekly',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      style: TextButton.styleFrom(
                        primary: selectedPeriodIndex == 2
                            ? ColorManager.kPrimary
                            : Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () => selectPeriod(3),
                      child: Text(
                        'Today',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      style: TextButton.styleFrom(
                        primary: selectedPeriodIndex == 3
                            ? ColorManager.kPrimary
                            : Colors.grey,
                      ),
                    ),
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
            color: Colors.black,
          ),
          DataTable(
            headingTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
            columnSpacing: 45.w,
            dataTextStyle: TextStyle(fontSize: 18.0.h, color: Colors.black),
            columns: [
              DataColumn(
                label: SizedBox(
                  width: 140.w,
                  child: Row(
                    children: [
                      Text(
                        'Bill ID',
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
                  width: 180.w,
                  child: Row(
                    children: [
                      Text(
                        'Data/Time',
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
                  width: 100.w,
                  child: Text(
                    'Service',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 18.h,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: 120.w,
                  child: Row(
                    children: [
                      Text(
                        'Employee',
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
                  width: 100.w,
                  child: Text(
                    'Member \n number',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 18.h,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: 100.w,
                  child: Text(
                    'Payment \n status',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 18.h,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: SizedBox(
                  width: 100.w,
                  child: Row(
                    children: [
                      Text(
                        'Amount',
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
              // visible icon data column
              DataColumn(label: SizedBox(width: 40.w,))
            ],
            rows: [
              for (int i = 0; i < 10; i++)
                DataRow(
                  cells: [
                    DataCell(Text(
                      '01005',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                    DataCell(Text(
                      '17 May 2022, 10:00 PM',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                    DataCell(Text(
                      'Hair cut',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                    DataCell(Text(
                      'Masud Rana',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                    DataCell(
                      Text(
                        '3',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffFFF5DC),
                        ),
                        child: Text(
                          'pending',
                          style: TextStyle(color: Color(0xffE2B102)),
                        ),
                      ),
                    ),
                    DataCell(Text(
                      '\$ 250',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                    DataCell(InkWell(onTap: (){
                      widget.controller.jumpToPage(6);
                    },child: Icon(Icons.visibility,color: Colors.grey,size: 25.h,))),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
