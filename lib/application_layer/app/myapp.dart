import 'package:pos_animal/application_layer/service/localizetion/changelangue.dart';
import 'package:pos_animal/application_layer/service/localizetion/translate.dart';
import 'package:pos_animal/presentation_layer/resources/routes_pages.dart';
import 'package:pos_animal/presentation_layer/resources/theme_manager.dart';
import 'package:pos_animal/presentation_layer/src/get_packge.dart';
import 'package:pos_animal/presentation_layer/src/style_packge.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: Locale("en"),
      theme: getApplicationTheme(),
      // home: TestScreen(),
      getPages: getPage,
      // home: HomeScreen(),
    );
  }
}
