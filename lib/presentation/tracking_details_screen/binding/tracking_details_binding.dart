import '../controller/tracking_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TrackingDetailsScreen.
///
/// This class ensures that the TrackingDetailsController is created when the
/// TrackingDetailsScreen is first loaded.
class TrackingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackingDetailsController());
  }
}
