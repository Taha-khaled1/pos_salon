import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/screens/orders/widgets/orders_table.dart';

import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<String> items = [
    'All',
    'Hair cut',
    'color',
    'spa',
    'Routine',
    'Hair cut'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Orders",
              style: TextStyle(
                  color: ColorManager.kPrimary,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.h,
            ),
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
            SizedBox(height: 20.h,),
            // order table
            Align(
              alignment: Alignment.center,
                child: OrdersTable())
          ],
        ),
      ),
    );
  }
}
