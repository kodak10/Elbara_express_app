import '../controller/empty_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EmptyAddressScreen.
///
/// This class ensures that the EmptyAddressController is created when the
/// EmptyAddressScreen is first loaded.
class EmptyAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmptyAddressController());
  }
}
