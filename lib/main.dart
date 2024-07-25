import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB0gDkkr1joWeyRz-T7Wx0YBSUiOtt-DjY',
      appId: '1:998391121356:android:5a1f9f942c51519aee8969',
      messagingSenderId: '998391121356',
      projectId: 'elbaraexpress-9b834',
      storageBucket:
          "elbaraexpress-9b834.appspot.com", // Nom du bucket uniquement
    ),
  );
  // await FirebaseAppCheck.instance.activate(
  //     webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //     androidProvider: AndroidProvider.playIntegrity,
  //     //androidProvider: AndroidProvider.playIntegrity,

  //     // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
  //         // your preferred provider. Choose from:
  //         // 1. Debug provider
  //         // 2. Device Check provider
  //         // 3. App Attest provider
  //         // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
  //     appleProvider: AppleProvider.appAttest,
  //   );
  
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        useMaterial3: true,
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: ColorConstant.whiteA700,
            surfaceTintColor: ColorConstant.whiteA700),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                surfaceTintColor:
                    MaterialStatePropertyAll(ColorConstant.whiteA700))),
        dialogTheme: DialogTheme(
            backgroundColor: ColorConstant.whiteA700,
            surfaceTintColor: ColorConstant.whiteA700),
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'Elbara Express',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
