import '../controller/customer_support_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CustomerSupportScreen.
///
/// This class ensures that the CustomerSupportController is created when the
/// CustomerSupportScreen is first loaded.
class CustomerSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerSupportController());
  }
}
