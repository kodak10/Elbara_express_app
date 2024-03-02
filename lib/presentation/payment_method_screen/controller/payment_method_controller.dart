import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/payment_method_screen/models/payment_method_model.dart';
import 'package:flutter/material.dart';

import '../models/payment_data.dart';

/// A controller class for the PaymentMethodScreen.
///
/// This class manages the state of the PaymentMethodScreen, including the
/// current paymentMethodModelObj
class PaymentMethodController extends GetxController {
  TextEditingController paymentdetailsController = TextEditingController();

  TextEditingController paymentdetailsController1 = TextEditingController();

  TextEditingController paymentdetailsController2 = TextEditingController();
  List<PaymentMethodModel> paymentMethods = PaymentData.getpaymentDAta();
  int currentPayment = 0;
  void setCurrentPaymentMethod(int index) {
    currentPayment = index;
    update();
  }
}
