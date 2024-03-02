import '../controller/cancel_order_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CancelOrderOneScreen.
///
/// This class ensures that the CancelOrderOneController is created when the
/// CancelOrderOneScreen is first loaded.
class CancelOrderOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CancelOrderOneController());
  }
}
