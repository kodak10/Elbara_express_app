import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/add_card_defualt_screen/models/add_card_defualt_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddCardDefualtScreen.
///
/// This class manages the state of the AddCardDefualtScreen, including the
/// current addCardDefualtModelObj
class AddCardDefualtController extends GetxController {
  TextEditingController cardnumberController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  Rx<AddCardDefualtModel> addCardDefualtModelObj = AddCardDefualtModel().obs;

  @override
  void onClose() {
    super.onClose();
    cardnumberController.dispose();
    dateController.dispose();
    cvvController.dispose();
  }
}
