import '../controller/profile_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ProfileDetailsScreen.
///
/// This class ensures that the ProfileDetailsController is created when the
/// ProfileDetailsScreen is first loaded.
class ProfileDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileDetailsController());
  }
}
