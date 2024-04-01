import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_animal/presentation_layer/screens/members/members_table.dart';

import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';
import 'memper_controller.dart';

// ignore: must_be_immutable
class MembersScreen extends StatefulWidget {
  final PageController pageController;

  MembersScreen({super.key, required this.pageController});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  List<String> items = [
    'First Name',
    'Last Name',
    'username',
    'Email',
    'PhoneNumber',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
        init: CustomerController(),
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
                          "Members",
                          style: TextStyle(
                              color: ColorManager.kPrimary,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // Members table
                        if (_.len != 0) MembersTable(),
                        if (_.len == 0)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Center(
                                child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/search_empty.png',
                                  height: 275.h,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "No members found Add new member now",
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.pageController.jumpToPage(7);
                                  },
                                  child: Container(
                                    width: 275.w,
                                    height: 55.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffF4E57E),
                                              Color(0xffDFC45D),
                                              Color(0xffBB9121)
                                            ])),
                                    child: Text(
                                      "+ Add New Member",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          )
                      ],
                    ),
                  ),
                );
        });
  }
}
