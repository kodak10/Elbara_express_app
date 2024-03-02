import '../controller/add_adress_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddAdressScreen.
///
/// This class ensures that the AddAdressController is created when the
/// AddAdressScreen is first loaded.
class AddAdressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAdressController());
  }
}
