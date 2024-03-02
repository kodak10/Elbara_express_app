import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_drop_down.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';

import 'controller/add_adress_controller.dart';

// ignore_for_file: must_be_immutable
class AddAdressScreen extends GetWidget<AddAdressController> {
  AddAdressScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      onTapArrowleft30();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_add_address".tr),
                styleType: Style.bgFillWhiteA700),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 18, right: 16, bottom: 18),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomFloatingEditText(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: controller.nameController,
                              labelText: "lbl_name".tr,
                              hintText: "lbl_ronald_richards".tr,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomFloatingEditText(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: controller.addressController,
                              labelText: "lbl_address".tr,
                              hintText: "msg_parker_rd_allentown".tr,
                              margin: getMargin(top: 16),
                              fontStyle: FloatingEditTextFontStyle
                                  .SFProDisplayRegular17),
                          CustomDropDown(
                              focusNode: FocusNode(),
                              autofocus: true,
                              icon: Container(
                                  margin: getMargin(left: 30, right: 15),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgArrowdown)),
                              hintText: "lbl_broome".tr,
                              margin: getMargin(top: 16),
                              items: controller.addAdressModelObj.value
                                  .dropdownItemList.value,
                              onChanged: (value) {
                                controller.onSelected(value);
                              }),
                          CustomDropDown(
                              focusNode: FocusNode(),
                              autofocus: true,
                              icon: Container(
                                  margin: getMargin(left: 30, right: 15),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgArrowdown)),
                              hintText: "lbl_new_york".tr,
                              margin: getMargin(top: 16),
                              items: controller.addAdressModelObj.value
                                  .dropdownItemList1.value,
                              onChanged: (value) {
                                controller.onSelected1(value);
                              }),
                          CustomDropDown(
                              focusNode: FocusNode(),
                              autofocus: true,
                              icon: Container(
                                  margin: getMargin(left: 30, right: 15),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgArrowdown)),
                              hintText: "lbl_united_state".tr,
                              margin: getMargin(top: 16),
                              items: controller.addAdressModelObj.value
                                  .dropdownItemList2.value,
                              onChanged: (value) {
                                controller.onSelected2(value);
                              }),
                          Container(
                              height: getVerticalSize(64),
                              width: getHorizontalSize(396),
                              margin: getMargin(top: 16, bottom: 5),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ColorConstant.whiteA700,
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(16)),
                                            border: Border.all(
                                                color: ColorConstant.gray300,
                                                width: getHorizontalSize(1))),
                                        child: Row(children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 16,
                                                  bottom: 16),
                                              child: CountryPickerUtils
                                                  .getDefaultFlagImage(Country(
                                                      isoCode: "",
                                                      iso3Code: "",
                                                      phoneCode: "",
                                                      name: "name"))),
                                          Padding(
                                              padding: getPadding(
                                                  left: 13, right: 199),
                                              child: CountryPickerUtils
                                                  .getDefaultFlagImage(Country(
                                                      isoCode: "",
                                                      iso3Code: "",
                                                      phoneCode: "",
                                                      name: "name")))
                                        ])),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            width: getHorizontalSize(96),
                                            margin: getMargin(left: 19),
                                            padding: getPadding(
                                                left: 3,
                                                top: 1,
                                                right: 3,
                                                bottom: 1),
                                            decoration: AppDecoration.txtWhite,
                                            child: Text("lbl_phone_number".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtFootnote)))
                                  ]))
                        ]))),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(54),
                text: "lbl_save".tr,
                margin: getMargin(left: 16, right: 16, bottom: 40))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft30() {
    Get.back();
  }
}
