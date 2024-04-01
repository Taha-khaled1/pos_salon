import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_animal/data_layer/database/database.dart';
import 'package:pos_animal/presentation_layer/components/custom_text_field.dart';
import 'package:pos_animal/presentation_layer/resources/color_manager.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/controller/home_controller.dart';
import 'package:pos_animal/presentation_layer/screens/service/widgets/right_side_widget.dart';
import 'package:pos_animal/presentation_layer/screens/service/widgets/services_grid_view_widget.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key, required this.controller});
  final PageController controller;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  HomeController homeController = Get.find();
  int selectedIndex = 0;

  List<String> items = [
    'All',
    'Hair cut',
    'color',
    'spa',
    'Routine',
    'Hair cut'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return _.load
              ? Center(child: CircularProgressIndicator())
              : Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Services",
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
                                    onChanged: (p0) {
                                      var x = homeController.search
                                          .where((element) {
                                        print("${element.title} c c " +
                                            p0.toString());
                                        return element.title
                                            .toString()
                                            .contains(p0.toString());
                                      }).toList();

                                      homeController.serviceModel!.data = x;
                                      // homeController.len = x.length;
                                      print("----------------> $x");
                                      setState(() {});
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
                                      itemBuilder:
                                          (BuildContext context, int index) {
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
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  width: 1,
                                                  color: ColorManager.grey2,
                                                )),
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                            ),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.w),
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
                            ServicesWidget()
                          ],
                        ),
                      ),
                    ),
                    //right side widget
                    RightSideWidget(
                      controller: widget.controller,
                    )
                  ],
                );
        });
  }
}
