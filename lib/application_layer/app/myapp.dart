import 'package:pos_animal/application_layer/service/localizetion/changelangue.dart';
import 'package:pos_animal/application_layer/service/localizetion/translate.dart';
import 'package:pos_animal/presentation_layer/resources/routes_pages.dart';
import 'package:pos_animal/presentation_layer/resources/theme_manager.dart';
import 'package:pos_animal/presentation_layer/src/get_packge.dart';
import 'package:pos_animal/presentation_layer/src/style_packge.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
      designSize: const Size(1440, 1025),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: MyTranslation(),
        locale: Locale("en"),
        theme: getApplicationTheme(),
// home: TestScreen(),
        getPages: getPage,
// home: HomeScreen(),
      ),
    );
  }
}
