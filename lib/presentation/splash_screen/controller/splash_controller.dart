import 'dart:async';

import 'package:get/get.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/splash_screen/models/splash_model.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    super.onReady();
    _redirectToScreen();
  }

  void _redirectToScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    if (await _isIntroSeen()) {
      _goToOnboardingScreen();
    } else if (await _isSignedIn()) {
      _goToLoginScreen();
    } else {
      _goToHomeScreen();
    }
  }

  Future<bool> _isIntroSeen() async {
    return await PrefUtils.getIsIntro();
  }

  Future<bool> _isSignedIn() async {
    return await PrefUtils.getIsSignIn();
  }

  void _goToOnboardingScreen() {
    Get.offNamed(AppRoutes.onboardingOneScreen);
  }

  void _goToLoginScreen() {
    Get.offNamed(AppRoutes.logInScreen);
  }

  void _goToHomeScreen() {
    Get.offNamed(AppRoutes.homeContainer1Screen);
  }
}
