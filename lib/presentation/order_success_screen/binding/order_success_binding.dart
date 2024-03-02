import '../controller/order_success_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderSuccessScreen.
///
/// This class ensures that the OrderSuccessController is created when the
/// OrderSuccessScreen is first loaded.
class OrderSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderSuccessController());
  }
}
