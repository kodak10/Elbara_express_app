import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/login_with_error_screen/models/login_with_error_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginWithErrorScreen.
///
/// This class manages the state of the LoginWithErrorScreen, including the
/// current loginWithErrorModelObj
class LoginWithErrorController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginWithErrorModel> loginWithErrorModelObj = LoginWithErrorModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
