import 'controller/empty_payment_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EmptyPaymentScreen extends GetWidget<EmptyPaymentController> {
  const EmptyPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      onTapArrowleft24();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_my_cards".tr),
                styleType: Style.bgFillWhiteA700),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 171),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          color: ColorConstant.deepPurple50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.circleBorder70),
                          child: Container(
                              height: getSize(140),
                              width: getSize(140),
                              padding: getPadding(all: 30),
                              decoration: AppDecoration.fillDeeppurple50
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder70),
                              child: Stack(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgPayment1,
                                    height: getSize(80),
                                    width: getSize(80),
                                    alignment: Alignment.center)
                              ]))),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Text("lbl_no_card_yet".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFProTextBold22)),
                      Container(
                          width: getHorizontalSize(270),
                          margin: getMargin(top: 12),
                          child: Text("msg_pellentesque_eu".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtBody)),
                      CustomButton(
                          height: getVerticalSize(53),
                          width: getHorizontalSize(178),
                          text: "lbl_add".tr,
                          margin: getMargin(top: 41, bottom: 5))
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft24() {
    Get.back();
  }
}
