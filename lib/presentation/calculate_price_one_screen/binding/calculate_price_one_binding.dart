import '../controller/calculate_price_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CalculatePriceOneScreen.
///
/// This class ensures that the CalculatePriceOneController is created when the
/// CalculatePriceOneScreen is first loaded.
class CalculatePriceOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculatePriceOneController());
  }
}
