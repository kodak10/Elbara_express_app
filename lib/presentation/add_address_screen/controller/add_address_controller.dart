import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/add_address_screen/models/add_address_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddAddressScreen.
///
/// This class manages the state of the AddAddressScreen, including the
/// current addAddressModelObj
class AddAddressController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController addressoneController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  Rx<AddAddressModel> addAddressModelObj = AddAddressModel().obs;

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
    addressoneController.dispose();
    phoneNumberController.dispose();
  }

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

  onSelected2(dynamic value) {
    for (var element in addAddressModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addAddressModelObj.value.dropdownItemList2.refresh();
  }
}
