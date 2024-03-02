import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/add_card_active_screen/models/add_card_active_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddCardActiveScreen.
///
/// This class manages the state of the AddCardActiveScreen, including the
/// current addCardActiveModelObj
class AddCardActiveController extends GetxController {
  TextEditingController cardnumberController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  Rx<AddCardActiveModel> addCardActiveModelObj = AddCardActiveModel().obs;

  @override
  void onClose() {
    super.onClose();
    cardnumberController.dispose();
    dateController.dispose();
    cvvController.dispose();
  }
}
