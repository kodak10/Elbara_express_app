import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/add_adress_screen/models/add_adress_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddAdressScreen.
///
/// This class manages the state of the AddAdressScreen, including the
/// current addAdressModelObj
class AddAdressController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  Rx<AddAdressModel> addAdressModelObj = AddAdressModel().obs;

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('1').obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in addAdressModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addAdressModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in addAdressModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addAdressModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in addAdressModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addAdressModelObj.value.dropdownItemList2.refresh();
  }
}
