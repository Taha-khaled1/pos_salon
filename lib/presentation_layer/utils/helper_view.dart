import 'package:pos_animal/presentation_layer/utils/responsive_design/enums/device_type.dart';
import 'package:pos_animal/presentation_layer/utils/responsive_design/models/device_info.dart';

class HelperView {
  static int childGridView(DeviceInfo deviceInfo) {
    switch (deviceInfo.deviceType) {
      case DeviceType.Mobile:
        return 2;

      case DeviceType.Tablet:
        return 3;

      case DeviceType.Desktop:
        return 4;
    }
  }

  static double collegeAspectRatio(DeviceInfo deviceInfo) {
    if (deviceInfo.localHeight < 650) {
      return 1;
    } else if (deviceInfo.localHeight < 750) {
      return 1.1;
    } else {
      return 1.4;
    }
  }

  static double widthForTextField(DeviceInfo deviceInfo) {
    if (deviceInfo.deviceType == DeviceType.Mobile) {
      return deviceInfo.localWidth * 0.99;
    } else {
      return 600;
    }
  }
}
