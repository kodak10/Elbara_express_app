import '../controller/city_selection_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CitySelectionScreen.
///
/// This class ensures that the CitySelectionController is created when the
/// CitySelectionScreen is first loaded.
class CitySelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CitySelectionController());
  }
}
