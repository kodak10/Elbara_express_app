import 'controller/cancel_order_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CancelOrderScreen extends GetWidget<CancelOrderController> {
  const CancelOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: getPadding(left: 0, right: 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  width: double.maxFinite,
                  child: Container(
                      margin: getMargin(bottom: 5),
                      padding:
                          getPadding(left: 30, top: 14, right: 30, bottom: 14),
                      decoration: AppDecoration.white.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("msg_are_you_sure_you".tr,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtHeadline),
                            Padding(
                                padding: getPadding(top: 33),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: CustomButton(
                                              height: getVerticalSize(46),
                                              text: "lbl_no".tr,
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
                                              text: "lbl_yes".tr,
                                              margin: getMargin(left: 10),
                                              padding:
                                                  ButtonPadding.PaddingAll11,
                                              fontStyle: ButtonFontStyle
                                                  .SFProDisplayBold18))
                                    ]))
                          ])))
            ]));
  }

  /// Navigates to the orderDetailsInTransitScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the orderDetailsInTransitScreen.
  onTapNo() {
    Get.back();
  }
}
