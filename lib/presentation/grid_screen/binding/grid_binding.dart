import '../controller/grid_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GridScreen.
///
/// This class ensures that the GridController is created when the
/// GridScreen is first loaded.
class GridBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GridController());
  }
}
