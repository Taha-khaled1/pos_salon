import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_animal/data_layer/models/bill.dart';
import 'package:pos_animal/presentation_layer/components/custom_elevated_button.dart';
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/screens/bills/bill_controller.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class BillsTable extends StatefulWidget {
  late PageController controller;
  BillsTable({super.key, required this.controller});

  @override
  State<BillsTable> createState() => _BillsTableState();
}

class _BillsTableState extends State<BillsTable> {
  int selectedPeriodIndex = 0;
  BillController billController = Get.find();
  TextEditingController searchController = TextEditingController();
  void selectPeriod(int index) {
    setState(() {
      selectedPeriodIndex = index;
    });
  }

  List<String> items = [
    'All',
    'Hair cut',
    'color',
    'spa',
    'Routine',
    'Hair cut'
  ];
  List<Data> search = [];
  int selectedIndex = 0;
  @override
  void initState() {
    search = billController.billModel!.data!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //search field
            CustomTextfield(
              searchController: searchController,
              icon: Icons.search,
              verticalPadding: 0,
              height: 45.h,
              validator: (search) {
                return null;
              },
              onSaved: (search) {
                return null;
              },
              onChanged: (p0) {
                var x = search.where((element) {
                  print("${element.order!.date} c c " + p0.toString());
                  return element.order!.date.toString().contains(p0.toString());
                }).toList();

                billController.billModel!.data = x;
                billController..len = x.length;
                print("----------------> $x");
                setState(() {});
              },
              titel: "Search date...",
              width: 430.w,
              suffixIcon: GestureDetector(
                onTap: () async {
                  print('xxxxxxxxxxxxxxxxxxxxxx');
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    print(
                        'Selected date: ${pickedDate.year}-${pickedDate.month}-${pickedDate.day}');
                    searchController.text =
                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";

                    var x = search.where((element) {
                      print("${element.order!.date} c c " +
                          searchController.text.toString());
                      return element.order!.date
                          .toString()
                          .contains(searchController.text.toString());
                    }).toList();

                    billController.billModel!.data = x;
                    billController..len = x.length;
                    print("----------------> $x");
                    setState(() {});
                    // Do something with the selected date
                  }
                },
                child: Icon(
                  Icons.date_range,
                  size: 25.w,
                  color: ColorManager.kPrimary,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            // filter widget
            Expanded(
              child: SizedBox(
                height: 38.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? ColorManager.beige
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1,
                              color: ColorManager.grey2,
                            )),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: selectedIndex == index
                                  ? ColorManager.kPrimary
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
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
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w700),
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
                          icon: Icons.local_printshop_outlined,
                          text: 'Re-print',
                          onPressed: () {},
                          textSize: 16.sp,
                          textColor: ColorManager.kPrimary,
                          iconSize: 18.h,
                          iconColor: ColorManager.kPrimary,
                          borderRadius: 30,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomElevatedButton(
                          height: 40.h,
                          width: 142.w,
                          backgroundColor: ColorManager.kPrimary,
                          borderColor: ColorManager.kPrimary,
                          text: 'Download',
                          onPressed: () {},
                          textSize: 16.sp,
                          textColor: Colors.white,
                          borderRadius: 30,
                          iconWidget: Image.asset(
                            'assets/icons/xl_file.png',
                            height: 18.h,
                          ),
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
                  DataColumn(
                      label: SizedBox(
                    width: 40.w,
                  ))
                ],
                rows: [
                  for (int i = 0; i < billController.len; i++)
                    DataRow(
                      cells: [
                        DataCell(Text(
                          billController.billModel?.data?[i].id.toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          billController.billModel?.data?[i].order?.date
                                  .toString() ??
                              '', // '17 May 2022, 10:00 PM',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          billController.billModel?.data?[i].order?.services?[0]
                                  .service?.title
                                  .toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          billController
                                  .billModel?.data?[i].order?.customer?.name
                                  .toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(
                          Text(
                            billController
                                    .billModel?.data?[i].order?.customer?.id
                                    .toString() ??
                                '',
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
                              billController
                                      .billModel?.data?[i].order?.paymentStatus
                                      .toString() ??
                                  '',
                              style: TextStyle(color: Color(0xffE2B102)),
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '\$ ${billController.billModel?.data?[i].order?.totalCost.toString()}',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(InkWell(
                            onTap: () {
                              widget.controller.jumpToPage(6);
                            },
                            child: Icon(
                              Icons.visibility,
                              color: Colors.grey,
                              size: 25.h,
                            ))),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
