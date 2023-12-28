import 'package:pos_animal/presentation_layer/components/custom_back_button.dart';
import 'package:pos_animal/presentation_layer/src/style_packge.dart';

PreferredSizeWidget appbar(String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorManager.background,
    title: Text(
      title,
      style: MangeStyles.textButtonStyle,
    ),
    centerTitle: true,
    leading: const Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomBackButton(),
    ),
    // actions: const [
    //   CustomBackButton(),
    //   SizedBox(
    //     width: 10,
    //   )
    // ],
  );
}
