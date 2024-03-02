import '../controller/empty_my_orders_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EmptyMyOrdersScreen.
///
/// This class ensures that the EmptyMyOrdersController is created when the
/// EmptyMyOrdersScreen is first loaded.
class EmptyMyOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmptyMyOrdersController());
  }
}
