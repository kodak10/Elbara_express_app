import '../controller/courier_services_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CourierServicesScreen.
///
/// This class ensures that the CourierServicesController is created when the
/// CourierServicesScreen is first loaded.
class CourierServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourierServicesController());
  }
}
