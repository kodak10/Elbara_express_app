import '../controller/payment_method_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentMethodOneScreen.
///
/// This class ensures that the PaymentMethodOneController is created when the
/// PaymentMethodOneScreen is first loaded.
class PaymentMethodOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodOneController());
  }
}
