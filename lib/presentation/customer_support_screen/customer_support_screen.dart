import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/customer_support_controller.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({Key? key}) : super(key: key);

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  CustomerSupportController controller = Get.put(CustomerSupportController());

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
              resizeToAvoidBottomInset: true,
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
                        onTapArrowleft32();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "msg_customer_support".tr),
                  styleType: Style.bgFillWhiteA700),
              body: Stack(
                children: [
                  Padding(
                    padding: getPadding(left: 16, right: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(right: 91),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgEllipse24,
                                        height: getSize(50),
                                        width: getSize(50),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(25)),
                                        margin: getMargin(bottom: 55)),
                                    Expanded(
                                        child: Padding(
                                            padding:
                                                getPadding(left: 8, top: 4),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "msg_customer_support".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtFootnoteGray600),
                                                  Container(
                                                      margin: getMargin(top: 6),
                                                      padding: getPadding(
                                                          left: 16,
                                                          top: 4,
                                                          right: 16,
                                                          bottom: 4),
                                                      decoration: AppDecoration
                                                          .fillGray50
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .customBorderTL16),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        215),
                                                                margin: getMargin(
                                                                    top: 2),
                                                                child: Text(
                                                                    "msg_hello_welcome_customer"
                                                                        .tr,
                                                                    maxLines:
                                                                        null,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtBody))
                                                          ])),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 2, top: 8),
                                                      child: Text(
                                                          "lbl_09_55_am".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtFootnoteGray600))
                                                ])))
                                  ])),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(left: 58, top: 15),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Padding(
                                                padding: getPadding(top: 3),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("lbl_you".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtFootnoteGray600),
                                                      Container(
                                                          margin:
                                                              getMargin(top: 7),
                                                          padding: getPadding(
                                                              left: 16,
                                                              top: 4,
                                                              right: 16,
                                                              bottom: 4),
                                                          decoration: AppDecoration
                                                              .fillDeeppurple50
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .customBorderTL16),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                    width:
                                                                        getHorizontalSize(
                                                                            244),
                                                                    margin: getMargin(
                                                                        right:
                                                                            3),
                                                                    child: Text(
                                                                        "msg_how_can_i_track"
                                                                            .tr,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtAvenirRegular16))
                                                              ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 8),
                                                          child: Text(
                                                              "lbl_09_55_am".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600))
                                                    ]))),
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgEllipse2450x50,
                                            height: getSize(50),
                                            width: getSize(50),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(25)),
                                            margin:
                                                getMargin(left: 8, bottom: 55))
                                      ]))),
                          Padding(
                              padding: getPadding(top: 15, right: 31),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgEllipse24,
                                        height: getSize(50),
                                        width: getSize(50),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(25)),
                                        margin: getMargin(bottom: 74)),
                                    Expanded(
                                        child: Padding(
                                            padding:
                                                getPadding(left: 8, top: 4),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "msg_customer_support".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtFootnoteGray600),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          307),
                                                      margin: getMargin(top: 6),
                                                      padding: getPadding(
                                                          left: 16,
                                                          top: 4,
                                                          right: 16,
                                                          bottom: 4),
                                                      decoration: AppDecoration
                                                          .fillGray50
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .customBorderTL16),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        269),
                                                                margin:
                                                                    getMargin(
                                                                        top: 2,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                    "msg_if_you_don_t_have"
                                                                        .tr,
                                                                    maxLines:
                                                                        null,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtBody))
                                                          ])),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 2, top: 8),
                                                      child: Text(
                                                          "lbl_09_55_am".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtFootnoteGray600))
                                                ])))
                                  ]))
                        ]),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: getPadding(left: 16, right: 16, bottom: 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                                  controller: controller.messagefourController,
                                  hintText: "Message".tr,
                                  variant: TextFormFieldVariant.FillGray50,
                                  shape: TextFormFieldShape.RoundedBorder16,
                                  padding: TextFormFieldPadding.PaddingT20,
                                  textInputAction: TextInputAction.done)),
                          SizedBox(
                            width: getHorizontalSize(16),
                          ),
                          Container(
                            height: getSize(58),
                            width: getSize(58),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstant.deepPurple600),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgSendmsgIcon,
                              height: getVerticalSize(35.4),
                              width: getHorizontalSize(35.4),
                              margin: getMargin(all: 11.28),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  onTapArrowleft32() {
    Get.back();
  }
}
