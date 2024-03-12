import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderExample extends StatelessWidget {
  final double value;

  const SliderExample({this.value = 0.0});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 10.h,
        activeTrackColor: Colors.amber,
        inactiveTrackColor: Colors.white,
        thumbShape: SliderComponentShape.noThumb,
      ),
      child: Slider(
        value: value,
        min: 0.0,
        max: 100.0,
        onChanged: (value){}, // Disable slider interaction
      ),
    );
  }
}