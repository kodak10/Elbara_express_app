import '../controller/order_details_in_transit_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderDetailsInTransitScreen.
///
/// This class ensures that the OrderDetailsInTransitController is created when the
/// OrderDetailsInTransitScreen is first loaded.
class OrderDetailsInTransitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailsInTransitController());
  }
}
