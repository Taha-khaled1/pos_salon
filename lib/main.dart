import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:pos_animal/application_layer/app/myapp.dart';
import 'package:flutter/material.dart';
import 'package:pos_animal/data_layer/database/sqlflite.dart';
import 'package:pos_animal/presentation_layer/screens/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

SqlDb? sqlDb;
late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  sqlDb = SqlDb();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences.setString("token",
      "SavClV3OmHkvRqoFWn5Bmc1daj0aDCMxzMzJQ9vlJrUBvsCiBP05TS0LcXzlury2kEi4oVYDyWwbqg3rlQ3hU3deoPG5oNKhWkG6yApjn3FhnK3Bgzc7BaHcsg9pkgr9RS3H0zdP5kudpVLGrd4gtvsbBWPneikEAUHxvuw9bRfkFwUcdBtrg9vsZhjShQWmYtlvdoLqinJCVmp9GZANVyTNetcpRI0vcPkz1hQBEK2pVH61FRsrrUbY35W7vM1TYt5dRBgCKu9aJVLks4WmZg0ltaoWZCIwuDiBK4jqj7ZFLJ5jzdjuCis8nSxkIE6yqVVkhRWPAna7ns31atFbsM0SmEfcX62BKVfNeAFtNTNSdzWosCUyXPPCVeuhDbIxMgIVEuaFnPxIrIukXVp4cURgM57JdCMqRvz9Sr4pHNI1AfWKyzB8PXvG57sz3euz73cFBqOmBNBds41Hj2RaR2l8rvn5LUUAmS1RU8I9GDTooaTrWvldg7ZOXhQVspPjpzl1BHwaecXksXif6oM4rZitnlfw67A2eIqmHiM2Ym4LNzgoQfgfGdVU96nNSVsaUrn8CzSlSqX1TwlOAYbrlCGtN9ACQrSiSJjuzVEnNSD8ylsFYy7lhSOKcGyyHZjQQYWc0j5nwlnYe7XOgWOVTtuhZPf3VdVipXIJpYG2kvx9K4mrgtmhYaf6Qpds5b75fc8d");

  // sharedPreferences.remove("token");
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // NotificationHandler notificationHandler = NotificationHandler();
  // await notificationHandler.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(DevicePreview(builder: (context) {
      return MyApp();
    }));
  });
  // runApp(
  //   MyApp()
  //   // DevicePreview(
  //   //   enabled: !kReleaseMode,
  //   //   builder: (context) => const MyApp(), // Wrap your app
  //   // ),
  // );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  // HomeController homeController = Get.put(HomeController());
  // homeController.cahngehasUnreadNotificationsTrue();
  // homeController.hasUnreadNotifications = true;
  // homeController.cahngehasUnsTrue();
}
