import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashLine extends StatelessWidget {
  const DashLine({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: List.generate(350~/10, (index) => Expanded(
        child: Container(
          color: index%2==0?Colors.transparent
              :Colors.grey.shade300,
          height: 1.h,
        ),
      )),
    );
  }
}
