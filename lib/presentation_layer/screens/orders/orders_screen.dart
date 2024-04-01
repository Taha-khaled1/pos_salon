import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/data_layer/models/order.dart';
import 'package:pos_animal/presentation_layer/screens/orders/order_controller.dart';
import 'package:pos_animal/presentation_layer/screens/orders/widgets/orders_table.dart';

import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        init: OrderController(),
        builder: (_) {
          return _.load
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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

                        // order table
                        Align(alignment: Alignment.center, child: OrdersTable())
                      ],
                    ),
                  ),
                );
        });
  }
}
