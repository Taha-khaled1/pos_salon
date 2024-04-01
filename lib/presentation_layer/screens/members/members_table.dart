import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_animal/presentation_layer/resources/styles_manager.dart';

import '../../../data_layer/models/customer.dart';
import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';
import 'memper_controller.dart';

// ignore: must_be_immutable
class MembersTable extends StatefulWidget {
  MembersTable({super.key});

  @override
  State<MembersTable> createState() => _MembersTableState();
}

class _MembersTableState extends State<MembersTable> {
  int selectedPeriodIndex = 0;
  CustomerController customerController = Get.find();
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
  int selectedIndex = 0;
  List<Data> search = [];
  @override
  void initState() {
    search = customerController.customerModel!.data!;
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
                  print("${element.name} c c " + p0.toString());
                  return element.name.toString().contains(p0.toString());
                }).toList();

                customerController.customerModel!.data = x;
                customerController.len = x.length;
                print("----------------> $x");
                setState(() {});
              },
              titel: "Search Members...",
              width: 430.w,
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
                      "Members List",
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
                dataTextStyle: TextStyle(fontSize: 18.0.h, color: Colors.black),
                columns: [
                  DataColumn(
                    label: Row(
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
                  DataColumn(
                    label: Row(
                      children: [
                        Text(
                          'Email',
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
                  DataColumn(
                    label: Text(
                      'Phone Number',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.black,
                        fontSize: 18.h,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Row(
                      children: [
                        Text(
                          'Country',
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
                  DataColumn(
                    label: Text(
                      'City',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.black,
                        fontSize: 18.h,
                      ),
                    ),
                  ),
                ],
                rows: [
                  for (int i = 0; i < customerController.len; i++)
                    DataRow(
                      cells: [
                        DataCell(Text(
                          customerController.customerModel?.data?[i].name
                                  .toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          customerController.customerModel?.data?[i].email
                                  .toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          customerController.customerModel?.data?[i].phone
                                  .toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          customerController
                                  .customerModel?.data?[i].location?.address
                                  .toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffE1FFDC),
                            ),
                            child: Text(
                              customerController
                                      .customerModel?.data?[i].emirate?.title
                                      .toString() ??
                                  '',
                              style: TextStyle(color: Color(0xff07A104)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  // Add more DataRow widgets here for additional rows
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
