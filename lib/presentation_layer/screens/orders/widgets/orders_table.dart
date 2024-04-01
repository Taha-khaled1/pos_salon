import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_animal/data_layer/models/order.dart';
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/screens/orders/order_controller.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class OrdersTable extends StatefulWidget {
  const OrdersTable({super.key});

  @override
  State<OrdersTable> createState() => _OrdersTableState();
}

class _OrdersTableState extends State<OrdersTable> {
  int selectedPeriodIndex = 0;
  OrderController orderController = Get.find();
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
    search = orderController.orderModel!.data!;
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
                  if (p0 != null) {
                    var x = search.where((element) {
                      if (element.services != null &&
                          element.services!.isNotEmpty &&
                          element.services![0].service != null &&
                          element.services![0].service!.title != null) {
                        print("${element.services![0].service!.title} c c " +
                            p0.toString());
                        return element.services![0].service!.title
                            .toString()
                            .contains(p0.toString());
                      }
                      return false;
                    }).toList();

                    orderController.orderModel!.data = x;
                    orderController.len = x.length;
                    print("----------------> $x");
                    setState(() {});
                  }
                },
                titel: "Search service...",
                width: 430.w),
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
                      "Order List",
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
                          'Order ID',
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
                  DataColumn(
                    label: Text(
                      'Service',
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
                  DataColumn(
                    label: Text(
                      'Status',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.black,
                        fontSize: 18.h,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Payment',
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
                ],
                rows: [
                  for (int i = 0; i < orderController.len; i++)
                    DataRow(
                      cells: [
                        DataCell(Text(
                          orderController.orderModel?.data?[i].id.toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          orderController.orderModel?.data?[i].date
                                  .toString() ??
                              '', // '17 May 2022, 10:00 PM',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          orderController.orderModel?.data?[i].services?[0]
                                  .service?.title
                                  .toString() ??
                              '',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                        DataCell(Text(
                          orderController.orderModel?.data?[i].customer?.name
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
                              orderController.orderModel?.data?[i].orderStatus
                                      .toString() ??
                                  '',
                              style: TextStyle(color: Color(0xff07A104)),
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
                              orderController.orderModel?.data?[i].paymentStatus
                                      .toString() ??
                                  '',
                              style: TextStyle(color: Color(0xffE2B102)),
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '\$ 250',
                          style: TextStyle(fontSize: 16.sp),
                        )),
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
