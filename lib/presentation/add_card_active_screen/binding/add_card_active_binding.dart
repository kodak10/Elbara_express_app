import '../controller/add_card_active_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddCardActiveScreen.
///
/// This class ensures that the AddCardActiveController is created when the
/// AddCardActiveScreen is first loaded.
class AddCardActiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCardActiveController());
  }
}
