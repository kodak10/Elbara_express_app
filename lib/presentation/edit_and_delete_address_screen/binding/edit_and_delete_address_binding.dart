import '../controller/edit_and_delete_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditAndDeleteAddressScreen.
///
/// This class ensures that the EditAndDeleteAddressController is created when the
/// EditAndDeleteAddressScreen is first loaded.
class EditAndDeleteAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditAndDeleteAddressController());
  }
}
