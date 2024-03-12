import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTitleVertical extends StatelessWidget {
  const IconTitleVertical({
    super.key,
    required this.image,
    required this.title,
    required this.color
    // required this.onTap,
    // this.Iscolor = false,
  });
  final String image, title;
  final Color color;
  // final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            color: color,
            height: 30.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 14.w,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              // height: 0.10,
            ),
          )
        ],
      ),
    );
  }
}
