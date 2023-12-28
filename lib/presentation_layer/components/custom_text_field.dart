import 'package:pos_animal/presentation_layer/src/style_packge.dart';
import 'package:pos_animal/presentation_layer/utils/helper_view.dart';
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
  // final int? maxLines;
  final Color? fillColor;
  final bool? enableBorder;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;

  const CustomTextfield({
    Key? key,
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
    // this.maxLines,
    this.fillColor,
    this.enableBorder = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Container(
          width: HelperView.widthForTextField(deviceInfo),
          color: ColorManager.white,
          child: TextFormField(
            style: const TextStyle(color: ColorManager.black),
            autocorrect: false,
            enableSuggestions: false,
            onTap: onTap,
            readOnly: readOnly,
            // maxLines: maxLines,
            initialValue: initialValue,
            textDirection: textDirection,
            obscureText: obscureText == null ? false : obscureText!,
            onSaved: onSaved,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: icon != null
                  ? IconButton(
                      onPressed: onIconTap,
                      icon: Icon(icon),
                    )
                  : null,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 1.2,
                  style: borderStyle ?? BorderStyle.solid,
                  color: ColorManager.grey2,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1.2,
                  color: ColorManager.grey2,
                ),
              ),

              //  enabled: true,
              filled: true,
              fillColor: Colors.white10,
              hintText: titel,
              hintStyle: MangeStyles().getBoldStyle(
                color: ColorManager.black,
                fontSize: FontSize.s16,
              ),
            ),
          ),
        );
      },
    );
  }
}
