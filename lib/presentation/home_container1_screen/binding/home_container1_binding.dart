import '../controller/home_container1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeContainer1Screen.
///
/// This class ensures that the HomeContainer1Controller is created when the
/// HomeContainer1Screen is first loaded.
class HomeContainer1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeContainer1Controller());
  }
}
