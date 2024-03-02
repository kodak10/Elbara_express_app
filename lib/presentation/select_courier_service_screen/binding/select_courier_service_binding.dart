import '../controller/select_courier_service_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectCourierServiceScreen.
///
/// This class ensures that the SelectCourierServiceController is created when the
/// SelectCourierServiceScreen is first loaded.
class SelectCourierServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCourierServiceController());
  }
}
