import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/calculate_price_one_screen/models/calculate_price_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CalculatePriceOneScreen.
///
/// This class manages the state of the CalculatePriceOneScreen, including the
/// current calculatePriceOneModelObj
class CalculatePriceOneController extends GetxController {
  TextEditingController locationController = TextEditingController();

  TextEditingController locationoneController = TextEditingController();

  TextEditingController grouptwentyfourController = TextEditingController();

  Rx<CalculatePriceOneModel> calculatePriceOneModelObj =
      CalculatePriceOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    locationController.dispose();
    locationoneController.dispose();
    grouptwentyfourController.dispose();
  }
}
