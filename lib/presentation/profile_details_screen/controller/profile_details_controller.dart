import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/profile_details_screen/models/profile_details_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ProfileDetailsScreen.
///
/// This class manages the state of the ProfileDetailsScreen, including the
/// current profileDetailsModelObj
class ProfileDetailsController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  
  Rx<ProfileDetailsModel> profileDetailsModelObj = ProfileDetailsModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
  }
}
