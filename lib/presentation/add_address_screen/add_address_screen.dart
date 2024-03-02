import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_drop_down.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/app_bar/appbar_subtitle_1.dart';
import 'controller/add_address_controller.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  AddAddressController controller = Get.put(AddAddressController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                appBar: CustomAppBar(
                    height: getVerticalSize(79),
                    leadingWidth: 42,
                    leading: AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgArrowleft,
                        margin: getMargin(left: 18, top: 29, bottom: 26),
                        onTap: () {
                          Get.back();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_add_new_address".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Form(
                    key: _formKey,
                    child: SizedBox(
                        width: double.maxFinite,
                        child: Container(
                            width: double.maxFinite,
                            margin: getMargin(top: 8),
                            padding: getPadding(all: 16),
                            decoration: AppDecoration.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomFloatingEditText(
                                      controller: controller.nameController,
                                      labelText: "lbl_name".tr,
                                      hintText: "lbl_name".tr,
                                      shape:
                                          FloatingEditTextShape.RoundedBorder8,
                                      padding:
                                          FloatingEditTextPadding.PaddingT17,
                                      textInputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidEmail(value,
                                                isRequired: true))) {
                                          return "Please enter valid text";
                                        }
                                        return null;
                                      }),
                                  CustomFloatingEditText(
                                      controller:
                                          controller.addressoneController,
                                      labelText: "lbl_address_line_1".tr,
                                      hintText: "lbl_address_line_1".tr,
                                      shape:
                                          FloatingEditTextShape.RoundedBorder8,
                                      padding:
                                          FloatingEditTextPadding.PaddingT17,
                                      margin: getMargin(top: 16),
                                      textInputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidEmail(value,
                                                isRequired: true))) {
                                          return "Please enter valid text";
                                        }
                                        return null;
                                      }),
                                  CustomFloatingEditText(
                                      controller: controller.addressController,
                                      labelText: "lbl_address_line_2".tr,
                                      hintText: "lbl_address_line_2".tr,
                                      shape:
                                          FloatingEditTextShape.RoundedBorder8,
                                      padding:
                                          FloatingEditTextPadding.PaddingT17,
                                      margin: getMargin(top: 16),
                                      textInputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidEmail(value,
                                                isRequired: true))) {
                                          return "Please enter valid text";
                                        }
                                        return null;
                                      }),
                                  CustomDropDown(
                                      padding: DropDownPadding.PaddingT17,
                                      icon: Container(
                                          margin:
                                              getMargin(left: 30, right: 15),
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowdown)),
                                      hintText: "lbl_united_state".tr,
                                      margin: getMargin(top: 16),
                                      items: controller.addAddressModelObj.value
                                          .dropdownItemList.value,
                                      onChanged: (value) {
                                        controller.onSelected(value);
                                      }),
                                  CustomDropDown(
                                      icon: Container(
                                          margin:
                                              getMargin(left: 30, right: 15),
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowdown)),
                                      hintText: "New york",
                                      margin: getMargin(top: 16),
                                      items: controller.addAddressModelObj.value
                                          .dropdownItemList1.value,
                                      onChanged: (value) {
                                        controller.onSelected1(value);
                                      }),
                                  CustomDropDown(
                                      icon: Container(
                                          margin:
                                              getMargin(left: 30, right: 15),
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowdown)),
                                      hintText: "lbl_broome".tr,
                                      margin: getMargin(top: 16),
                                      items: controller.addAddressModelObj.value
                                          .dropdownItemList2.value,
                                      onChanged: (value) {
                                        controller.onSelected2(value);
                                      }),
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  phone_number_field(
                                      controller.phoneNumberController, (p0) {
                                    if (p0 == null || p0.number.isEmpty) {
                                      return "Enter valid number";
                                    }
                                    return null;
                                  }),
                                  Spacer(),
                                  CustomButton(
                                      height: getVerticalSize(54),
                                      text: "lbl_save".tr,
                                      margin: getMargin(bottom: 24),
                                      onTap: () {
                                        onTapSave();
                                      })
                                ])))))));
  }

  onTapSave() {
    Get.back();
  }

  onTapArrowleft19() {
    Get.back();
  }
}
