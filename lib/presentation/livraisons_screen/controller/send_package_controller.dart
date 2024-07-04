import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/add_address_screen/controller/add_address_controller.dart';
import 'package:elbara_express/presentation/add_address_screen/models/add_address_model.dart';
import 'package:elbara_express/presentation/send_package_screen/models/send_package_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SendPackageScreen.
///
/// This class manages the state of the SendPackageScreen, including the
/// current sendPackageModelObj
class SendPackageController extends GetxController {


  Rx<AddAddressModel> addAddressModelObj = AddAddressModel().obs;



  Rx<SendPackageModel> sendPackageModelObj = SendPackageModel().obs;

  onSelected(dynamic value) {
    for (var element in addAddressModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addAddressModelObj.value.dropdownItemList.refresh();
  }

   onSelected1(dynamic value) {
    for (var element in addAddressModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addAddressModelObj.value.dropdownItemList1.refresh();
  }

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
