import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/password_reset_success_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PasswordResetSuccessScreen extends StatefulWidget {
  const PasswordResetSuccessScreen({Key? key}) : super(key: key);

  @override
  State<PasswordResetSuccessScreen> createState() =>
      _PasswordResetSuccessScreenState();
}

class _PasswordResetSuccessScreenState
    extends State<PasswordResetSuccessScreen> {
  PasswordResetSuccessController controller =
      Get.put(PasswordResetSuccessController());
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
                backgroundColor: ColorConstant.whiteA700,
                body: Container(
                    width: double.maxFinite,
                    padding: getPadding(left: 40, right: 40),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              color: ColorConstant.deepPurple50,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder70),
                              child: Container(
                                  height: getSize(140),
                                  width: getSize(140),
                                  padding: getPadding(
                                      left: 36, top: 30, right: 36, bottom: 30),
                                  decoration: AppDecoration.fillDeeppurple50
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder70),
                                  child: Stack(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgLock,
                                        height: getVerticalSize(80),
                                        width: getHorizontalSize(67),
                                        alignment: Alignment.center)
                                  ]))),
                          Padding(
                              padding: getPadding(top: 13),
                              child: Text("msg_password_reset".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProTextBold22)),
                          Container(
                              width: getHorizontalSize(344),
                              margin: getMargin(top: 12),
                              child: Text("msg_you_have_successfully".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtBody)),
                          CustomButton(
                              height: getVerticalSize(53),
                              width: getHorizontalSize(164),
                              text: "lbl_go_to_login".tr,
                              margin: getMargin(top: 38, bottom: 5),
                              onTap: () {
                                onTapGotologin();
                              })
                        ])))));
  }

  onTapGotologin() {
    Get.offAllNamed(AppRoutes.logInScreen);
  }
}
