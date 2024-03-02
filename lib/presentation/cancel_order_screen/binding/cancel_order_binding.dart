import '../controller/cancel_order_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CancelOrderScreen.
///
/// This class ensures that the CancelOrderController is created when the
/// CancelOrderScreen is first loaded.
class CancelOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CancelOrderController());
  }
}
