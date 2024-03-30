import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pos_animal/application_layer/app/myapp.dart';
import 'package:flutter/material.dart';
import 'package:pos_animal/data_layer/database/sqlflite.dart';
import 'package:pos_animal/presentation_layer/screens/firebase_options.dart';
import 'package:pos_animal/presentation_layer/utils/NotificationHandler.dart';
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
      "Cok2VzMoLa3XpSjCT5XXhbKNWKJESDiU2C82a818WUtlSGNEx1RuvvDHkGPJ2U68IxSIkwm2AKL8F64dAtHP4Y0OQiQpZjjilFYysDc2UOcTGNMrH15cW6EezM5INXxa55nozB4RW4EcbmliWvTAM5TIoUQdkNZf2GbWmD9wIlylUotbZr9vNUxIxXvrLBKbSjQrZadJWzwKbGhLGPU1PXQGsAJTPYBHQOShtoCknCUZpug3RrXJnd9YWWOVfCBl0FArvx74P9t3rgbVpEqRDQwibECEC0yVltitnzhHC0wUoqQEgmAmU1nrNmo08v78pggfPwWIB00Pcc5acjrib0pgRkQgqgTvoKyW7NUN5bmMdI5SjKoVO7jSTx9w1FGD6h0B8YYuWkbkiSBb35Aj5NbtPX6xtd89XVaZp1jjM3ucMEQgH0bOwge2EvXRYNeStJSyX2VJ5PxXDgiRZ8QypKUk7QBdB20QcxT7V3VjeTvGWHwUyhP3YnJPTYvxz0pBw7NYT3bsPL9sR1YCc6vaGKYYy5rydrkWLzyveTmZT2ytsIIeGhVCpmvlLoYEPBr02EVuebtXvhTHNdHWohWvRk53SeS6MKR9kjAomPNo4h6wQ0egXFob5G2MjPKqEPzgSMlSfLEdGNTSmrGZtqVDL02CdLIsBXfg35eoyfJHQkJ4hUUeiAmfUxf1o07E856816af");
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
