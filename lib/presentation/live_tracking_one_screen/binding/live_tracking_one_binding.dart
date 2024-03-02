import '../controller/live_tracking_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LiveTrackingOneScreen.
///
/// This class ensures that the LiveTrackingOneController is created when the
/// LiveTrackingOneScreen is first loaded.
class LiveTrackingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveTrackingOneController());
  }
}
