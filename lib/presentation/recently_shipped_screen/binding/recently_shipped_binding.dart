import '../controller/recently_shipped_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RecentlyShippedScreen.
///
/// This class ensures that the RecentlyShippedController is created when the
/// RecentlyShippedScreen is first loaded.
class RecentlyShippedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecentlyShippedController());
  }
}
