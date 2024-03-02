import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/payment_method_one_screen/models/payment_method_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PaymentMethodOneScreen.
///
/// This class manages the state of the PaymentMethodOneScreen, including the
/// current paymentMethodOneModelObj
class PaymentMethodOneController extends GetxController {
  TextEditingController paypalController = TextEditingController();

  TextEditingController visaController = TextEditingController();

  TextEditingController applepayController = TextEditingController();

  Rx<PaymentMethodOneModel> paymentMethodOneModelObj =
      PaymentMethodOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    paypalController.dispose();
    visaController.dispose();
    applepayController.dispose();
  }
}
