import 'package:pos_animal/presentation_layer/src/style_packge.dart';
import 'package:pos_animal/presentation_layer/utils/helper_view.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.backgroundColor,
    required this.text,
    required this.press,
    this.rectangel,
    this.colorText,
    this.colorborder,
    this.sideIs,
    this.fontSize,
    this.fontWeight
  });

  final Color backgroundColor;
  final String text;
  final double? width, height;
  final void Function()? press;
  final double? rectangel;
  final Color? colorText;
  final Color? colorborder;
  final BorderSide? sideIs;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Container(
          // margin: const EdgeInsets.all(7),
          width: width ?? HelperView.widthForTextField(deviceInfo),
          height: height ?? 55,

          // color: ColorManager.background,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: sideIs ?? BorderSide.none,
                  borderRadius: BorderRadius.circular(rectangel ?? 12),
                ),
              ),
            ),
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: FontConstants.fontFamily,
                fontSize: fontSize ?? FontSize.s16,
                color: colorText ?? ColorManager.white,
                fontWeight:fontWeight?? FontWeight.w700
              ),
            ),
          ),
        );
      },
    );
  }
}
