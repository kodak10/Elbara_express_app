import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final User? user = FirebaseAuth.instance.currentUser;
  
  if (await _isIntroSeen()) {
    _goToOnboardingScreen();
  } else if (user != null) {
    // Get user type from Firestore
    String? userRole = await _getUserRole(user.uid);
    if (userRole == "user") {
      _goToHomeScreen();
    } else if (userRole == "gare") {
      _goToGareScreen();
    } else {
      // Handle other user types or scenarios
    }
  } else {
    _goToLoginScreen();
  }
}

Future<String?> _getUserRole(String userId) async {
  try {
    // Logic to fetch user role from Firestore
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection("users").doc(userId).get();
    Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

    if (userData != null && userData.containsKey('role')) {
      return userData['role'];
    } else {
      return null; // Handle scenario where role data is missing
    }
  } catch (e) {
    print("Impossible de trouver le role du l'utilisateur: $e");
    return null;
  }
}


void _goToGareScreen() {
  Get.offNamed(AppRoutes.homeGestionnaireScreen);
}


  Future<bool> _isIntroSeen() async {
    return await PrefUtils.getIsIntro();
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
