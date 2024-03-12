import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/screens/reports/widgets/card_static.dart';
import 'package:pos_animal/presentation_layer/screens/reports/widgets/reports_table.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class TopMembersScreen extends StatefulWidget {
  const TopMembersScreen({super.key});

  @override
  State<TopMembersScreen> createState() => _TopMembersScreenState();
}

class _TopMembersScreenState extends State<TopMembersScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Reports",
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kPrimary,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [for (int i = 0; i < statics.length; i++) statics[i]],
          ),
          SizedBox(
            height: 20.h,
          ),
        ReportsTable()
        ],
      ),
    );
  }
}
