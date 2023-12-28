import 'package:flutter/material.dart';

import '../enums/device_type.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  double width = (mediaQueryData.orientation == Orientation.landscape)
      ? mediaQueryData.size.height
      : mediaQueryData.size.width;

  if (width >= 950) return DeviceType.Desktop;
  if (width >= 600) return DeviceType.Tablet;
  return DeviceType.Mobile;
}
