import '../controller/select_delivery_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectDeliveryAddressScreen.
///
/// This class ensures that the SelectDeliveryAddressController is created when the
/// SelectDeliveryAddressScreen is first loaded.
class SelectDeliveryAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectDeliveryAddressController());
  }
}
