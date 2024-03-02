import 'controller/tracking_details_two_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class TrackingDetailsTwoScreen extends GetWidget<TrackingDetailsTwoController> {
  const TrackingDetailsTwoScreen({Key? key}) : super(key: key);

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
                      onTapArrowleft16();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "msg_tracking_details".tr),
                styleType: Style.bgFillWhiteA700),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(all: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: getPadding(all: 16),
                          decoration: AppDecoration.fillGray50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder8),
                          child: Row(children: [
                            CustomIconButton(
                                height: 64,
                                width: 64,
                                shape: IconButtonShape.CircleBorder32,
                                padding: IconButtonPadding.PaddingAll14,
                                child: CustomImageView(
                                    svgPath: ImageConstant
                                        .imgArrowdownDeepPurple600)),
                            Padding(
                                padding: getPadding(left: 8, top: 8, bottom: 4),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_202022194".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtHeadline),
                                      Container(
                                          height: getVerticalSize(16),
                                          width: getHorizontalSize(140),
                                          margin: getMargin(top: 12),
                                          child: Stack(
                                              alignment: Alignment.topLeft,
                                              children: [
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        "msg_on_going_9_may".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtFootnote)),
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                        height: getSize(3),
                                                        width: getSize(3),
                                                        margin: getMargin(
                                                            left: 60, top: 5),
                                                        decoration: BoxDecoration(
                                                            color: ColorConstant
                                                                .black900,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    getHorizontalSize(
                                                                        1)))))
                                              ]))
                                    ]))
                          ])),
                      Container(
                          height: getVerticalSize(224),
                          width: getHorizontalSize(396),
                          margin: getMargin(top: 16),
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle4428,
                                height: getVerticalSize(224),
                                width: getHorizontalSize(396),
                                radius:
                                    BorderRadius.circular(getHorizontalSize(8)),
                                alignment: Alignment.center),
                            CustomButton(
                                height: getVerticalSize(40),
                                width: getHorizontalSize(143),
                                text: "lbl_live_tracking".tr,
                                margin: getMargin(left: 8, bottom: 8),
                                padding: ButtonPadding.PaddingAll11,
                                fontStyle:
                                    ButtonFontStyle.SFProTextBold15WhiteA700,
                                onTap: () {
                                  onTapLivetracking();
                                },
                                alignment: Alignment.bottomLeft)
                          ])),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Text("msg_tracking_history".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFProTextBold20)),
                      Container(
                          height: getVerticalSize(339),
                          width: getHorizontalSize(201),
                          margin: getMargin(top: 22, bottom: 5),
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgSettings,
                                          height: getSize(18),
                                          width: getSize(18),
                                          margin:
                                              getMargin(top: 14, bottom: 18)),
                                      Container(
                                          height: getVerticalSize(51),
                                          width: getHorizontalSize(151),
                                          margin: getMargin(left: 14),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgGroup38077,
                                                    height: getSize(3),
                                                    width: getSize(3),
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    margin: getMargin(
                                                        left: 71, bottom: 7)),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "lbl_checking".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtHeadline),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 13),
                                                              child: Text(
                                                                  "msg_completed_9_may"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtFootnote))
                                                        ]))
                                              ]))
                                    ])),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                    padding: getPadding(top: 96, bottom: 191),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgSettings,
                                              height: getSize(18),
                                              width: getSize(18),
                                              margin: getMargin(
                                                  top: 14, bottom: 18)),
                                          SizedBox(
                                              height: getVerticalSize(51),
                                              width: getHorizontalSize(169),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgGroup38077,
                                                        height: getSize(3),
                                                        width: getSize(3),
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        margin: getMargin(
                                                            left: 71,
                                                            bottom: 7)),
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "msg_waiting_for_pick"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtHeadline),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              13),
                                                                  child: Text(
                                                                      "msg_completed_10_may"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtFootnote))
                                                            ]))
                                                  ]))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(bottom: 96),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgSettings,
                                              height: getSize(18),
                                              width: getSize(18),
                                              margin: getMargin(
                                                  top: 16, bottom: 18)),
                                          Container(
                                              height: getVerticalSize(53),
                                              width: getHorizontalSize(153),
                                              margin: getMargin(left: 14),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgGroup38077,
                                                        height: getSize(3),
                                                        width: getSize(3),
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        margin: getMargin(
                                                            left: 68,
                                                            bottom: 7)),
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "lbl_in_transit"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtHeadline),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              15),
                                                                  child: Text(
                                                                      "msg_on_transit_10"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtFootnote))
                                                            ]))
                                                  ]))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgEyeGray600,
                                          height: getSize(18),
                                          width: getSize(18),
                                          margin:
                                              getMargin(top: 15, bottom: 18)),
                                      Container(
                                          height: getVerticalSize(51),
                                          width: getHorizontalSize(136),
                                          margin: getMargin(left: 14),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgGroup38077,
                                                    height: getSize(3),
                                                    width: getSize(3),
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    margin: getMargin(
                                                        left: 53, bottom: 6)),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "lbl_out_of_delivery"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtHeadline),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 13),
                                                              child: Text(
                                                                  "msg_pending_9_may"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtFootnote))
                                                        ]))
                                              ]))
                                    ])),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(left: 9),
                                    child: SizedBox(
                                        height: getVerticalSize(110),
                                        child: VerticalDivider(
                                            width: getHorizontalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.black900,
                                            indent: getHorizontalSize(32))))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 9),
                                    child: SizedBox(
                                        height: getVerticalSize(78),
                                        child: VerticalDivider(
                                            width: getHorizontalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.black900)))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 9),
                                    child: SizedBox(
                                        height: getVerticalSize(114),
                                        child: VerticalDivider(
                                            width: getHorizontalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.gray300,
                                            endIndent: getHorizontalSize(36)))))
                          ]))
                    ]))));
  }

  /// Navigates to the liveTrackingScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the liveTrackingScreen.
  onTapLivetracking() {
    Get.toNamed(
      AppRoutes.liveTrackingScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft16() {
    Get.back();
  }
}
