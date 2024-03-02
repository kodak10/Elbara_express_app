import 'controller/empty_address_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EmptyAddressScreen extends GetWidget<EmptyAddressController> {
  const EmptyAddressScreen({Key? key}) : super(key: key);

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
                      onTapArrowleft28();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_my_address".tr),
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
                              padding: getPadding(
                                  left: 41, top: 30, right: 41, bottom: 30),
                              decoration: AppDecoration.fillDeeppurple50
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder70),
                              child: Stack(children: [
                                CustomImageView(
                                    svgPath:
                                        ImageConstant.imgLocationDeepPurple600,
                                    height: getVerticalSize(80),
                                    width: getHorizontalSize(57),
                                    alignment: Alignment.center)
                              ]))),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Text("lbl_no_address_yet".tr,
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
  onTapArrowleft28() {
    Get.back();
  }
}
