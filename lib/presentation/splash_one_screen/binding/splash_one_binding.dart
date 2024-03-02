import '../controller/splash_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SplashOneScreen.
///
/// This class ensures that the SplashOneController is created when the
/// SplashOneScreen is first loaded.
class SplashOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashOneController());
  }
}
