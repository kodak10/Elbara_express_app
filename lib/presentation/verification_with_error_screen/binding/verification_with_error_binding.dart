import '../controller/verification_with_error_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VerificationWithErrorScreen.
///
/// This class ensures that the VerificationWithErrorController is created when the
/// VerificationWithErrorScreen is first loaded.
class VerificationWithErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationWithErrorController());
  }
}
