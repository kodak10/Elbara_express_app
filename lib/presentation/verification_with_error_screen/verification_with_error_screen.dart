import 'controller/verification_with_error_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationWithErrorScreen
    extends GetWidget<VerificationWithErrorController> {
  const VerificationWithErrorScreen({Key? key}) : super(key: key);

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
                      onTapArrowleft2();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_verification".tr),
                styleType: Style.bgFillWhiteA700),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 12, right: 16, bottom: 12),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: getHorizontalSize(355),
                          margin: getMargin(left: 20, right: 20),
                          child: Text("msg_please_provide_the".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtBody)),
                      Padding(
                          padding: getPadding(top: 30),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_code_sent_to".tr,
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(16),
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "msg_ronaldrichards_gmail_com".tr,
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(16),
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w900))
                              ]),
                              textAlign: TextAlign.left)),
                      Padding(
                          padding: getPadding(left: 3, top: 27, right: 3),
                          child: Obx(() => PinCodeTextField(
                              appContext: context,
                              controller: controller.otpController.value,
                              length: 6,
                              obscureText: false,
                              obscuringCharacter: '*',
                              keyboardType: TextInputType.number,
                              autoDismissKeyboard: true,
                              enableActiveFill: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {},
                              textStyle: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(24),
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400),
                              pinTheme: PinTheme(
                                  fieldHeight: getHorizontalSize(50),
                                  fieldWidth: getHorizontalSize(50),
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(8)),
                                  selectedFillColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  activeFillColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  inactiveFillColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  inactiveColor: ColorConstant.red700,
                                  selectedColor: ColorConstant.red700,
                                  activeColor: ColorConstant.red700)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 3, top: 17),
                              child: Text("msg_please_enter_a_valid2".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtBodyRed700))),
                      CustomButton(
                          height: getVerticalSize(54),
                          text: "lbl_verify".tr,
                          margin: getMargin(top: 32),
                          onTap: () {
                            onTapVerify();
                          }),
                      Padding(
                          padding: getPadding(top: 32, bottom: 5),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_don_t_receive_code2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(16),
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "lbl_resend_code".tr,
                                    style: TextStyle(
                                        color: ColorConstant.deepPurple600,
                                        fontSize: getFontSize(16),
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w600))
                              ]),
                              textAlign: TextAlign.left))
                    ]))));
  }

  /// Navigates to the resetPasswordScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the resetPasswordScreen.
  onTapVerify() {
    Get.toNamed(
      AppRoutes.resetPasswordScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft2() {
    Get.back();
  }
}
