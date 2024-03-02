import '../controller/log_out_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LogOutScreen.
///
/// This class ensures that the LogOutController is created when the
/// LogOutScreen is first loaded.
class LogOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogOutController());
  }
}
