import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/calculate_price_screen/models/calculate_price_model.dart';

/// A controller class for the CalculatePriceScreen.
///
/// This class manages the state of the CalculatePriceScreen, including the
/// current calculatePriceModelObj
class CalculatePriceController extends GetxController {
  Rx<CalculatePriceModel> calculatePriceModelObj = CalculatePriceModel().obs;
}
