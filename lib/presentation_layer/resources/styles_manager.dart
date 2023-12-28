import 'package:flutter/material.dart';
import 'package:pos_animal/presentation_layer/resources/color_manager.dart';

import 'font_manager.dart';

class MangeStyles {
  static const TextStyle textButtonStyle = TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s20,
    color: ColorManager.white,
  );
  TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: FontConstants.fontFamily,
    );
  }

  TextStyle getBoldStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.bold, color);
  }

// regular style

  TextStyle getRegularStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color);
  }

// medium style

  TextStyle getMediumStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.medium, color);
  }

// medium style

  TextStyle getLightStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.light, color);
  }

// bold style

// semibold style

  TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
  }

  TextStyle getTitel({double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
  }
}
