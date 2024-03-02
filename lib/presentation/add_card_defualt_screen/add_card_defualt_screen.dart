import 'controller/add_card_defualt_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AddCardDefualtScreen extends GetWidget<AddCardDefualtController> {
  AddCardDefualtScreen({Key? key}) : super(key: key);

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
                      onTapArrowleft25();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_add_card".tr),
                styleType: Style.bgFillWhiteA700),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 14, right: 16, bottom: 14),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: getHorizontalSize(315),
                              margin: getMargin(left: 39, right: 40),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_enter_your_card2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "lbl_learn_more".tr,
                                        style: TextStyle(
                                            color: ColorConstant.deepPurple600,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w400))
                                  ]),
                                  textAlign: TextAlign.center)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: controller.cardnumberController,
                              hintText: "lbl_card_number".tr,
                              margin: getMargin(top: 23),
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 16),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: CustomTextFormField(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller:
                                                controller.dateController,
                                            hintText: "lbl_exp_date".tr,
                                            margin: getMargin(right: 8))),
                                    Expanded(
                                        child: CustomTextFormField(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller:
                                                controller.cvvController,
                                            hintText: "lbl_cvv".tr,
                                            margin: getMargin(left: 8),
                                            textInputAction:
                                                TextInputAction.done))
                                  ])),
                          CustomButton(
                              height: getVerticalSize(54),
                              text: "lbl_add_card".tr,
                              margin: getMargin(top: 30, bottom: 5),
                              onTap: () {
                                onTapAddcard();
                              })
                        ])))));
  }

  /// Navigates to the paymentMethodOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the paymentMethodOneScreen.
  onTapAddcard() {
    Get.toNamed(
      AppRoutes.paymentMethodOneScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft25() {
    Get.back();
  }
}
