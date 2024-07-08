import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/verification_screen/models/verification_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the VerificationScreen.
///
/// This class manages the state of the VerificationScreen, including the
/// current verificationModelObj
class VerificationController extends GetxController {
  Rx<String> verificationId = ''.obs;
  Rx<String> otpController = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
