import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_animal/data_layer/models/bill.dart';
import 'package:pos_animal/presentation_layer/screens/Bills/widgets/Bills_table.dart';
import 'package:pos_animal/presentation_layer/screens/bills/bill_controller.dart';

import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';

class BillsScreen extends StatefulWidget {
  final PageController pageController;
  BillsScreen({super.key, required this.pageController});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillController>(
        init: BillController(),
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
                        GestureDetector(
                          onTap: () async {
                            try {
                              _.billModel =
                                  await BillModel.fromJson(_.responset);
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            "Bills",
                            style: TextStyle(
                                color: ColorManager.kPrimary,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // Bills table
                        Align(
                            alignment: Alignment.center,
                            child: BillsTable(
                              controller: widget.pageController,
                            ))
                      ],
                    ),
                  ),
                );
        });
  }
}
