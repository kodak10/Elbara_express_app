import '../controller/live_tracking_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LiveTrackingScreen.
///
/// This class ensures that the LiveTrackingController is created when the
/// LiveTrackingScreen is first loaded.
class LiveTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveTrackingController());
  }
}
