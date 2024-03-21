import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importer le package pour gérer la mémoire locale


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyB0gDkkr1joWeyRz-T7Wx0YBSUiOtt-DjY',
        appId: '1:998391121356:android:5a1f9f942c51519aee8969',
        messagingSenderId: '998391121356',
        projectId: 'elbaraexpress-9b834',
      ),
    );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
    ),
  );

final SharedPreferences prefs = await SharedPreferences.getInstance();
  // final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  // final User? user = FirebaseAuth.instance.currentUser;

  // runApp(MyApp(isLoggedIn: isLoggedIn, user: user));

  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
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
