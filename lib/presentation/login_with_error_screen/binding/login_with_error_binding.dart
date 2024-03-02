import '../controller/login_with_error_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginWithErrorScreen.
///
/// This class ensures that the LoginWithErrorController is created when the
/// LoginWithErrorScreen is first loaded.
class LoginWithErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginWithErrorController());
  }
}
