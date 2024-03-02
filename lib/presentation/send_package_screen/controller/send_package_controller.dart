import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/send_package_screen/models/send_package_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SendPackageScreen.
///
/// This class manages the state of the SendPackageScreen, including the
/// current sendPackageModelObj
class SendPackageController extends GetxController {
  // TextEditingController locationController = TextEditingController();

  // TextEditingController locationoneController = TextEditingController();

  // TextEditingController grouptwentyfourController = TextEditingController();

  Rx<SendPackageModel> sendPackageModelObj = SendPackageModel().obs;
  int packageQuentyty = 1;

  void increagePackageQuentity() {
    packageQuentyty++;
    update();
  }

  void decreseQuentity() {
    packageQuentyty--;
    update();
  }
}
