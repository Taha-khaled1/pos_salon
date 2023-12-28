import 'package:pos_animal/presentation_layer/src/get_packge.dart';
import 'package:pos_animal/presentation_layer/src/style_packge.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap ??
            () {
              Get.back();
            },
        child: Container(
          color: ColorManager.background,
          height: 40,
          width: 40,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[700],
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
