import 'package:pos_animal/main.dart';
import 'package:pos_animal/presentation_layer/resources/routes_manager.dart';
import 'package:get/get.dart';
import 'package:pos_animal/presentation_layer/screens/home_screen/home_screen.dart';

import '../screens/auth/auth_screen.dart';


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
        sharedPreferences.getInt("id") == null ? AuthScreen() : HomeScreen(),
  ),
];
