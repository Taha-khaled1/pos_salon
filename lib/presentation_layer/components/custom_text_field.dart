import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_animal/presentation_layer/src/style_packge.dart';
import 'package:pos_animal/presentation_layer/utils/responsive_design/ui_components/info_widget.dart';

class CustomTextfield extends StatelessWidget {
  final String titel;
  final bool? obscureText;
  final IconData? icon;
  final VoidCallback? onIconTap;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double width;
  final TextDirection? textDirection;
  final String? initialValue;
  final BorderStyle? borderStyle;
  final int? maxLines;
  final Color? fillColor;
  final bool? enableBorder;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final double? height;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final Widget? suffixIcon;
  final double? fontSize;
  final bool? enabled;
  final TextEditingController? searchController;
  const CustomTextfield(
      {Key? key,
      this.icon,
      this.onIconTap,
      this.obscureText,
      required this.validator,
      required this.onSaved,
      required this.titel,
      required this.width,
      this.textDirection,
      this.initialValue,
      this.borderStyle,
      this.maxLines,
      this.fillColor,
      this.enableBorder = true,
      this.readOnly = false,
      this.onTap,
      this.onChanged,
      this.height,
      this.verticalPadding,
      this.horizontalPadding,
      this.borderRadius,
      this.suffixIcon,
      this.fontSize,
      this.enabled,
      this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Container(
          width: width,
          height: height ?? 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
            color: ColorManager.white,
          ),
          child: TextFormField(
            controller: searchController,
            enabled: enabled ?? true,
            style: TextStyle(
                color: ColorManager.black, fontSize: fontSize ?? 16.sp),
            autocorrect: false,
            enableSuggestions: false,
            onTap: onTap,
            readOnly: readOnly,
            maxLines: maxLines ?? 1,
            initialValue: initialValue,
            textDirection: textDirection,
            obscureText: obscureText == null ? false : obscureText!,
            onSaved: onSaved,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: verticalPadding ?? 5.h,
                  horizontal: horizontalPadding ?? 0),
              prefixIcon: icon != null
                  ? IconButton(
                      onPressed: onIconTap,
                      icon: Icon(
                        icon,
                        color: Colors.black87,
                        size: 25.r,
                      ),
                    )
                  : null,
              suffixIcon: suffixIcon ?? null,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 30),
                borderSide: BorderSide(
                  width: 1,
                  style: borderStyle ?? BorderStyle.solid,
                  color: ColorManager.grey2,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 30),
                borderSide: const BorderSide(
                  width: 1.2,
                  color: ColorManager.grey2,
                ),
              ),

              //  enabled: true,
              filled: true,
              fillColor: Colors.white10,
              hintText: titel,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: fontSize ?? 18.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
