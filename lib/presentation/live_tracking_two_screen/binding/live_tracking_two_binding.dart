import '../controller/live_tracking_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LiveTrackingTwoScreen.
///
/// This class ensures that the LiveTrackingTwoController is created when the
/// LiveTrackingTwoScreen is first loaded.
class LiveTrackingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveTrackingTwoController());
  }
}
