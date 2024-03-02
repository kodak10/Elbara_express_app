import '../controller/empty_notifications_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EmptyNotificationsScreen.
///
/// This class ensures that the EmptyNotificationsController is created when the
/// EmptyNotificationsScreen is first loaded.
class EmptyNotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmptyNotificationsController());
  }
}
