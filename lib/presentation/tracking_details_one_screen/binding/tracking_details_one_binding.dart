import '../controller/tracking_details_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TrackingDetailsOneScreen.
///
/// This class ensures that the TrackingDetailsOneController is created when the
/// TrackingDetailsOneScreen is first loaded.
class TrackingDetailsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackingDetailsOneController());
  }
}
