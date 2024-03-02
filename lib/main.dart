import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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

  runApp(MyApp());
}


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//        apiKey: "AIzaSyCOwcttLnCPQsHxr-kMMdCkZeGTLtSxYWs",
//       appId: "1:681350177041:ios:7c6339d023fbeb5c786cb0",
//       messagingSenderId: "681350177041",
//       projectId: "elbara-express-4r2l6q",
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }

//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.light, // For iOS: (dark icons)
//       statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
//     ),
//   );

//   runApp(MyApp());
// }

// void main() async {

//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();

//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     // Replace with actual values
//     options: const FirebaseOptions(
//       apiKey: "AIzaSyCOwcttLnCPQsHxr-kMMdCkZeGTLtSxYWs",
//       appId: "1:681350177041:ios:7c6339d023fbeb5c786cb0",
//       messagingSenderId: "681350177041",
//       projectId: "elbara-express-4r2l6q",
//     ),

//   );
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.light, // For iOS: (dark icons)
//       statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
//     ),
//   );
//   runApp(MyApp());

//   // WidgetsFlutterBinding.ensureInitialized();
//   // SystemChrome.setPreferredOrientations([
//   //   DeviceOrientation.portraitUp,
//   // ]).then((value) {
//   //   Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
//   //   runApp(MyApp());
//   // });
// }

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
