import '../controller/password_reset_success_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PasswordResetSuccessScreen.
///
/// This class ensures that the PasswordResetSuccessController is created when the
/// PasswordResetSuccessScreen is first loaded.
class PasswordResetSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordResetSuccessController());
  }
}
