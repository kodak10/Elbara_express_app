import 'controller/login_with_error_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginWithErrorScreen extends GetWidget<LoginWithErrorController> {
  LoginWithErrorScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 41, right: 16, bottom: 41),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(top: 5),
                              child: Text("lbl_log_in".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProTextBold28)),
                          Padding(
                              padding: getPadding(top: 22),
                              child: Text("msg_welcome_back_let_s".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtBody)),
                          SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                  margin: getMargin(top: 31),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder16),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomFloatingEditText(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller:
                                                controller.emailController,
                                            labelText: "lbl_email_address".tr,
                                            hintText: "lbl_email_address".tr,
                                            variant: FloatingEditTextVariant
                                                .OutlineRed700,
                                            shape: FloatingEditTextShape
                                                .RoundedBorder8,
                                            padding: FloatingEditTextPadding
                                                .PaddingT17,
                                            textInputType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value == null ||
                                                  (!isValidEmail(value,
                                                      isRequired: true))) {
                                                return "Please enter valid email";
                                              }
                                              return null;
                                            }),
                                        Padding(
                                            padding: getPadding(top: 10),
                                            child: Text(
                                                "msg_please_enter_a_valid".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtBodyRed700))
                                      ]))),
                          SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                  margin: getMargin(top: 22),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder16),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomFloatingEditText(
                                            focusNode: FocusNode(),
                                            autofocus: true,
                                            controller:
                                                controller.passwordController,
                                            labelText: "lbl_password".tr,
                                            hintText: "lbl_password".tr,
                                            variant: FloatingEditTextVariant
                                                .OutlineRed700,
                                            shape: FloatingEditTextShape
                                                .RoundedBorder8,
                                            padding: FloatingEditTextPadding
                                                .PaddingT17,
                                            textInputAction:
                                                TextInputAction.done,
                                            textInputType:
                                                TextInputType.visiblePassword,
                                            isObscureText: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  (!isValidPassword(value,
                                                      isRequired: true))) {
                                                return "Please enter valid password";
                                              }
                                              return null;
                                            }),
                                        Padding(
                                            padding: getPadding(top: 11),
                                            child: Text(
                                                "msg_please_enter_a_8".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtBodyRed700))
                                      ]))),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotpassword();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 25),
                                      child: Text("msg_forgot_password".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody)))),
                          CustomButton(
                              height: getVerticalSize(54),
                              text: "lbl_log_in".tr,
                              margin: getMargin(top: 30),
                              onTap: () {
                                onTapLogin();
                              }),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("lbl_or".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtHeadline)),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: CustomButton(
                                            height: getVerticalSize(54),
                                            text: "lbl_google".tr,
                                            margin: getMargin(right: 8),
                                            variant: ButtonVariant.FillGray50,
                                            padding: ButtonPadding.PaddingT17,
                                            fontStyle: ButtonFontStyle
                                                .SFProTextSemibold16,
                                            prefixWidget: Container(
                                                margin: getMargin(right: 16),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgGoogle)),
                                            onTap: () {
                                              onTapGoogle();
                                            })),
                                    Expanded(
                                        child: CustomButton(
                                            height: getVerticalSize(54),
                                            text: "lbl_apple".tr,
                                            margin: getMargin(left: 8),
                                            variant: ButtonVariant.FillGray50,
                                            padding: ButtonPadding.PaddingT17,
                                            fontStyle: ButtonFontStyle
                                                .SFProTextSemibold16,
                                            prefixWidget: Container(
                                                margin: getMargin(right: 16),
                                                child: CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgFire)),
                                            onTap: () {
                                              onTapApple();
                                            }))
                                  ])),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount();
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "lbl_sign_up".tr,
                                        style: TextStyle(
                                            color: ColorConstant.deepPurple600,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w400))
                                  ]),
                                  textAlign: TextAlign.left))
                        ])))));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the forgotPasswordScreen.
  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the homeContainer1Screen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the homeContainer1Screen.
  onTapLogin() {
    Get.toNamed(
      AppRoutes.homeContainer1Screen,
    );
  }

  /// Navigates to the homeContainer1Screen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the homeContainer1Screen.
  onTapGoogle() {
    Get.toNamed(
      AppRoutes.homeContainer1Screen,
    );
  }

  /// Navigates to the homeContainer1Screen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the homeContainer1Screen.
  onTapApple() {
    Get.toNamed(
      AppRoutes.homeContainer1Screen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the signUpScreen.
  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
