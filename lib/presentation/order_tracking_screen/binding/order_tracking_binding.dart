import '../controller/order_tracking_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderTrackingScreen.
///
/// This class ensures that the OrderTrackingController is created when the
/// OrderTrackingScreen is first loaded.
class OrderTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderTrackingController());
  }
}
