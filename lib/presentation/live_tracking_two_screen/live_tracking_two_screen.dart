import 'controller/live_tracking_two_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class LiveTrackingTwoScreen extends GetWidget<LiveTrackingTwoController> {
  const LiveTrackingTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
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
                      onTapArrowleft13();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_live_tracking".tr),
                styleType: Style.bgFillWhiteA700),
            body: Container(
                width: size.width,
                height: size.height,
                padding: getPadding(top: 79),
                decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgLivetrackingtwo),
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(),
                          SizedBox(
                              height: getVerticalSize(427),
                              width: getHorizontalSize(371),
                              child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            decoration: AppDecoration.white
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CustomIconButton(
                                                      height: 60,
                                                      width: 60,
                                                      variant: IconButtonVariant
                                                          .OutlineGray300,
                                                      shape: IconButtonShape
                                                          .CustomBorderTL8,
                                                      padding: IconButtonPadding
                                                          .PaddingAll18,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMenuBlack900)),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgPlusBlack900,
                                                      height: getSize(24),
                                                      width: getSize(24),
                                                      margin: getMargin(
                                                          top: 18, bottom: 18))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: getMargin(bottom: 136),
                                            color: ColorConstant.whiteA700,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                            child: Container(
                                                height: getSize(60),
                                                width: getSize(60),
                                                padding: getPadding(all: 12),
                                                decoration: AppDecoration.white
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Stack(children: [
                                                  CustomIconButton(
                                                      height: 36,
                                                      width: 36,
                                                      variant: IconButtonVariant
                                                          .FillDeeppurple600,
                                                      alignment:
                                                          Alignment.center,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgGroup29))
                                                ])))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: SizedBox(
                                            height: getVerticalSize(319),
                                            width: getHorizontalSize(354),
                                            child: Stack(
                                                alignment: Alignment.bottomLeft,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVector4,
                                                      height:
                                                          getVerticalSize(289),
                                                      width: getHorizontalSize(
                                                          297),
                                                      alignment:
                                                          Alignment.topCenter),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Card(
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          elevation: 0,
                                                          margin:
                                                              EdgeInsets.all(0),
                                                          color: ColorConstant
                                                              .deepPurple60075,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .circleBorder20),
                                                          child: Container(
                                                              height:
                                                                  getSize(40),
                                                              width:
                                                                  getSize(40),
                                                              padding:
                                                                  getPadding(
                                                                      all: 6),
                                                              decoration: AppDecoration
                                                                  .fillDeeppurple60075
                                                                  .copyWith(
                                                                      borderRadius:
                                                                          BorderRadiusStyle
                                                                              .circleBorder20),
                                                              child: Stack(
                                                                  children: [
                                                                    CustomIconButton(
                                                                        height:
                                                                            28,
                                                                        width:
                                                                            28,
                                                                        variant:
                                                                            IconButtonVariant
                                                                                .FillDeeppurple600,
                                                                        shape: IconButtonShape
                                                                            .CircleBorder14,
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child: CustomImageView(
                                                                            svgPath:
                                                                                ImageConstant.imgMailWhiteA700))
                                                                  ])))),
                                                  CustomIconButton(
                                                      height: 34,
                                                      width: 34,
                                                      margin:
                                                          getMargin(top: 44),
                                                      variant: IconButtonVariant
                                                          .FillDeeppurple600,
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgLocationWhiteA700))
                                                ])))
                                  ])),
                          Container(
                              height: getVerticalSize(210),
                              width: double.maxFinite,
                              margin: getMargin(top: 30),
                              child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            padding: getPadding(
                                                left: 179,
                                                top: 15,
                                                right: 179,
                                                bottom: 15),
                                            decoration: AppDecoration.white
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .customBorderTL32),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          bottom: 175),
                                                      child: Divider(
                                                          height:
                                                              getVerticalSize(
                                                                  5),
                                                          thickness:
                                                              getVerticalSize(
                                                                  5),
                                                          color: ColorConstant
                                                              .gray300))
                                                ]))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding:
                                                getPadding(left: 16, right: 16),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "msg_package_information"
                                                          .tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFProTextBold20),
                                                  Container(
                                                      margin:
                                                          getMargin(top: 18),
                                                      padding:
                                                          getPadding(all: 16),
                                                      decoration: AppDecoration
                                                          .fillGray50
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder8),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        146),
                                                                margin:
                                                                    getMargin(
                                                                        top: 1),
                                                                child: RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                              text: "lbl_delivery_type".tr,
                                                                              style: TextStyle(color: ColorConstant.gray600, fontSize: getFontSize(16), fontFamily: 'SF Pro Text', fontWeight: FontWeight.w400)),
                                                                          TextSpan(
                                                                              text: " \n".tr,
                                                                              style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(16), fontFamily: 'SF Pro Text', fontWeight: FontWeight.w400)),
                                                                          TextSpan(
                                                                              text: "msg_express_delivery".tr,
                                                                              style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(18), fontFamily: 'SF Pro Text', fontWeight: FontWeight.w600))
                                                                        ]),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left)),
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        99),
                                                                margin:
                                                                    getMargin(
                                                                        top: 1),
                                                                child: RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                              text: "lbl_status".tr,
                                                                              style: TextStyle(color: ColorConstant.gray600, fontSize: getFontSize(16), fontFamily: 'SF Pro Text', fontWeight: FontWeight.w400)),
                                                                          TextSpan(
                                                                              text: " \n".tr,
                                                                              style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(16), fontFamily: 'SF Pro Text', fontWeight: FontWeight.w400)),
                                                                          TextSpan(
                                                                              text: "lbl_on_the_way".tr,
                                                                              style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(18), fontFamily: 'SF Pro Text', fontWeight: FontWeight.w600))
                                                                        ]),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left))
                                                          ]))
                                                ])))
                                  ]))
                        ])))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft13() {
    Get.back();
  }
}
