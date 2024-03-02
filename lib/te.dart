import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart'; // Importez Get pour utiliser GetMaterialApp
import 'core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Utilisez GetMaterialApp au lieu de MaterialApp
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        useMaterial3: true,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: ColorConstant.whiteA700,
          surfaceTintColor: ColorConstant.whiteA700,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            surfaceTintColor: MaterialStateProperty.all(ColorConstant.whiteA700),
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: ColorConstant.whiteA700,
          surfaceTintColor: ColorConstant.whiteA700,
        ),
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale, // Utilisez Get.deviceLocale au lieu de InitialBindings()
      fallbackLocale: Locale('en', 'US'),
      title: 'Elbara Express',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
