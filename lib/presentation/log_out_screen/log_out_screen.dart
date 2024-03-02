import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/custum_bottom_bar_controller.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  CustomBottomBarController customBottomBarController =
      Get.put(CustomBottomBarController());

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: double.maxFinite,
              child: Container(
                  margin: getMargin(bottom: 5),
                  padding: getPadding(left: 30, top: 27, right: 30, bottom: 27),
                  decoration: AppDecoration.white.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: getPadding(top: 7),
                            child: Text("msg_are_you_sure_you3".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtHeadline)),
                        Padding(
                            padding: getPadding(top: 31),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: CustomButton(
                                          onTap: () {
                                            Get.back();
                                          },
                                          height: getVerticalSize(46),
                                          text: "lbl_cancel".tr,
                                          margin: getMargin(right: 10),
                                          variant: ButtonVariant
                                              .OutlineDeeppurple600,
                                          padding: ButtonPadding.PaddingAll11,
                                          fontStyle: ButtonFontStyle
                                              .SFProTextBold18Deeppurple600)),
                                  Expanded(
                                      child: CustomButton(
                                    height: getVerticalSize(46),
                                    text: "lbl_log_out".tr,
                                    margin: getMargin(left: 10),
                                    padding: ButtonPadding.PaddingAll11,
                                    fontStyle:
                                        ButtonFontStyle.SFProDisplayBold18,
                                    onTap: () {
                                      PrefUtils.setIsSignIn(true);
                                      customBottomBarController.getIndex(0);
                                      Get.offAllNamed(AppRoutes.logInScreen);
                                    },
                                  ))
                                ]))
                      ])))
        ]);
  }

  onTapLogout() {
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }
}
