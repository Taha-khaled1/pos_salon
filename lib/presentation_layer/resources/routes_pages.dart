import 'package:pos_animal/main.dart';
import 'package:pos_animal/presentation_layer/resources/routes_manager.dart';
import 'package:get/get.dart';
import 'package:pos_animal/presentation_layer/screen/home_screen/home_screen.dart';

import '../screen/login/login.dart';

List<GetPage<dynamic>>? getPage = [
  // GetPage(
  //     name: Routes.startpage,
  //     page: () => const LoginScreen(),
  //     binding: BindingsBuilder(() {
  //       Get.lazyPut<LoginController>(() => LoginController());
  //     }),
  //     middlewares: [
  //       Midelware(),
  //     ]),
  GetPage(
    name: Routes.startpage,
    page: () =>
        sharedPreferences.getInt("id") == null ? LoginScreen() : HomeScreen(),
  ),
];