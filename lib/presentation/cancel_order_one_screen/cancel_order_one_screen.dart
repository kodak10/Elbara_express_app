import 'controller/cancel_order_one_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CancelOrderOneScreen extends GetWidget<CancelOrderOneController> {
  const CancelOrderOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: getPadding(left: 27, right: 27),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  width: double.maxFinite,
                  child: Container(
                      margin: getMargin(bottom: 5),
                      padding:
                          getPadding(left: 0, top: 27, right: 0, bottom: 27),
                      decoration: AppDecoration.white.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: getPadding(top: 7),
                                child: Text("msg_are_you_sure_you2".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtHeadline)),
                            Padding(
                                padding: getPadding(left: 9, top: 31, right: 9),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: CustomButton(
                                              height: getVerticalSize(46),
                                              text: "Non".tr,
                                              margin: getMargin(right: 10),
                                              variant: ButtonVariant
                                                  .OutlineDeeppurple600,
                                              padding:
                                                  ButtonPadding.PaddingAll11,
                                              fontStyle: ButtonFontStyle
                                                  .SFProTextBold18Deeppurple600,
                                              onTap: () {
                                                onTapNo();
                                              })),
                                      Expanded(
                                          child: CustomButton(
                                              onTap: () {
                                                Get.back();
                                              },
                                              height: getVerticalSize(46),
                                              text: "Oui".tr,
                                              margin: getMargin(left: 10),
                                              padding:
                                                  ButtonPadding.PaddingAll11,
                                              fontStyle: ButtonFontStyle
                                                  .SFProDisplayBold18))
                                    ]))
                          ])))
            ]));
  }

  onTapNo() {
    Get.back();
  }
}
