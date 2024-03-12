import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final Color textColor;
  final Color iconColor;
  final double textSize;
  final double iconSize;
  final double width;
  final double height;
  final Widget? iconWidget;
  final IconData? icon;

  const CustomElevatedButton({
     this.icon,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.borderColor,
    this.borderRadius = 8.0,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.textSize = 16.0,
    this.iconSize = 24.0,
    this.width = double.infinity,
    this.height = 48.0,
    this.iconWidget
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: textColor,
          side: BorderSide(color: borderColor??Colors.transparent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
         if(icon != null)  Icon(icon, size: iconSize, color: iconColor) ,
            if (icon == null && iconWidget != null) SizedBox(width: iconSize,height: iconSize,child: iconWidget,),
            SizedBox(width: 5.w),
            Text(
              text,
              style: TextStyle(fontSize: textSize, color: textColor,fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}