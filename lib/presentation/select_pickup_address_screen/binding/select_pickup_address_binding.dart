import '../controller/select_pickup_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectPickupAddressScreen.
///
/// This class ensures that the SelectPickupAddressController is created when the
/// SelectPickupAddressScreen is first loaded.
class SelectPickupAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectPickupAddressController());
  }
}
