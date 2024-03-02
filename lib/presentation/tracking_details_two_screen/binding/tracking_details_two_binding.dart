import '../controller/tracking_details_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TrackingDetailsTwoScreen.
///
/// This class ensures that the TrackingDetailsTwoController is created when the
/// TrackingDetailsTwoScreen is first loaded.
class TrackingDetailsTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackingDetailsTwoController());
  }
}
