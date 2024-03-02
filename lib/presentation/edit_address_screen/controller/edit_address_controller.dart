import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/edit_address_screen/models/edit_address_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditAddressScreen.
///
/// This class manages the state of the EditAddressScreen, including the
/// current editAddressModelObj
class EditAddressController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController addressoneController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  Rx<EditAddressModel> editAddressModelObj = EditAddressModel().obs;

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('1').obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  onSelected(dynamic value) {
    for (var element in editAddressModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editAddressModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in editAddressModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editAddressModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in editAddressModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editAddressModelObj.value.dropdownItemList2.refresh();
  }
}
