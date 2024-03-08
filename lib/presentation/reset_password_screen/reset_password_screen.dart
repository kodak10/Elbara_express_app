import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordController controller = Get.put(ResetPasswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                          onTapArrowleft3();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_reset_password".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 16, top: 12, right: 16, bottom: 12),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: getHorizontalSize(355),
                                  margin: getMargin(left: 20, right: 19),
                                  child: Text("msg_please_provide_the".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtBody)),
                              Obx(() => CustomFloatingEditText(
                                  controller: controller.newpasswordController,
                                  labelText: "lbl_new_password".tr,
                                  hintText: "lbl_new_password".tr,
                                  margin: getMargin(top: 29),
                                  padding: FloatingEditTextPadding.PaddingTB23,
                                  fontStyle: FloatingEditTextFontStyle
                                      .SFProTextRegular15,
                                  textInputType: TextInputType.visiblePassword,
                                  isObscureText:
                                      controller.isShowPassword.value,
                                  suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword.value =
                                            !controller.isShowPassword.value;
                                      },
                                      child: Container(
                                          margin:
                                              getMargin(left: 16, right: 16),
                                          child: CustomImageView(
                                              svgPath: controller
                                                      .isShowPassword.value
                                                  ? ImageConstant.imgCheckmark
                                                  : ImageConstant
                                                      .imgCheckmark))),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(62)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid password";
                                    }
                                    return null;
                                  })),
                              Obx(() => CustomFloatingEditText(
                                  controller:
                                      controller.confirmpasswordController,
                                  labelText: "msg_confirm_password".tr,
                                  hintText: "msg_confirm_password".tr,
                                  margin: getMargin(top: 16),
                                  padding: FloatingEditTextPadding.PaddingTB23,
                                  fontStyle: FloatingEditTextFontStyle
                                      .SFProTextRegular15,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  isObscureText:
                                      controller.isShowPassword1.value,
                                  suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword1.value =
                                            !controller.isShowPassword1.value;
                                      },
                                      child: Container(
                                          margin:
                                              getMargin(left: 16, right: 16),
                                          child: CustomImageView(
                                              svgPath: controller
                                                      .isShowPassword1.value
                                                  ? ImageConstant.imgCheckmark
                                                  : ImageConstant
                                                      .imgCheckmark))),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(62)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Veuillez entrer un mot de passe valide";
                                    }
                                    return null;
                                  })),
                              CustomButton(
                                  height: getVerticalSize(54),
                                  text: "lbl_reset_password".tr,
                                  margin: getMargin(top: 42, bottom: 5),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      onTapResetpassword();
                                    }
                                  })
                            ]))))));
  }

  onTapResetpassword() {
    Get.toNamed(AppRoutes.passwordResetSuccessScreen);
  }

  onTapArrowleft3() {
    Get.back();
  }
}
