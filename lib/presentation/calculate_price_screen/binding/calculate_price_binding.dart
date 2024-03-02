import '../controller/calculate_price_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CalculatePriceScreen.
///
/// This class ensures that the CalculatePriceController is created when the
/// CalculatePriceScreen is first loaded.
class CalculatePriceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculatePriceController());
  }
}
