import '../controller/empty_payment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EmptyPaymentScreen.
///
/// This class ensures that the EmptyPaymentController is created when the
/// EmptyPaymentScreen is first loaded.
class EmptyPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmptyPaymentController());
  }
}
