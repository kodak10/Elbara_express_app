import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/verification_with_error_screen/models/verification_with_error_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the VerificationWithErrorScreen.
///
/// This class manages the state of the VerificationWithErrorScreen, including the
/// current verificationWithErrorModelObj
class VerificationWithErrorController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<VerificationWithErrorModel> verificationWithErrorModelObj =
      VerificationWithErrorModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
