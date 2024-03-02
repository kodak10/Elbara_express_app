import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle_1.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/chat_bot_controller.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  ChatBotScreenController controller = Get.put(ChatBotScreenController());

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
                        Get.back();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "Chatbot"),
                  styleType: Style.bgFillWhiteA700),
              body: Stack(
                children: [
                  Expanded(
                    child: ListView(
                      padding: getPadding(left: 16, right: 16, bottom: 125),
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(right: 91),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: getSize(50),
                                            width: getSize(50),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorConstant.gray200),
                                            child: Padding(
                                              padding: getPadding(all: 13),
                                              child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgmessegeBlackIcon,
                                                height: getSize(24),
                                                width: getSize(24),
                                              ),
                                            )),
                                        Expanded(
                                            child: Padding(
                                                padding:
                                                    getPadding(left: 8, top: 4),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("Chatbot",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtFootnoteGray600),
                                                      Container(
                                                          margin:
                                                              getMargin(top: 6),
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
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                    width:
                                                                        getHorizontalSize(
                                                                            278),
                                                                    margin:
                                                                        getMargin(
                                                                            top:
                                                                                2),
                                                                    child: Text(
                                                                        "Welcome to courier ! I'm here to help you with any questions or concerns you may have. How can I assist you today?",
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
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600))
                                                    ])))
                                      ])),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: getPadding(left: 58, top: 15),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Padding(
                                                    padding: getPadding(top: 3),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("lbl_you".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600),
                                                          Container(
                                                              margin: getMargin(
                                                                  top: 7),
                                                              padding:
                                                                  getPadding(
                                                                      left: 16,
                                                                      top: 4,
                                                                      right: 16,
                                                                      bottom:
                                                                          4),
                                                              decoration: AppDecoration
                                                                  .fillDeeppurple50
                                                                  .copyWith(
                                                                      borderRadius:
                                                                          BorderRadiusStyle
                                                                              .customBorderTR16),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                        width: getHorizontalSize(
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
                                                                                TextAlign.left,
                                                                            style: AppStyle.txtAvenirRegular16))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 8),
                                                              child: Text(
                                                                  "lbl_09_55_am"
                                                                      .tr,
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
                                                imagePath: ImageConstant
                                                    .imgEllipse2450x50,
                                                height: getSize(50),
                                                width: getSize(50),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(25)),
                                                margin: getMargin(
                                                    left: 8, bottom: 55))
                                          ]))),
                              Padding(
                                  padding: getPadding(top: 15, right: 31),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: getSize(50),
                                            width: getSize(50),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorConstant.gray200),
                                            child: Padding(
                                              padding: getPadding(all: 13),
                                              child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgmessegeBlackIcon,
                                                height: getSize(24),
                                                width: getSize(24),
                                              ),
                                            )),
                                        Expanded(
                                            child: Padding(
                                                padding:
                                                    getPadding(left: 8, top: 4),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("Chatbot",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtFootnoteGray600),
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  307),
                                                          margin:
                                                              getMargin(top: 6),
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
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                    width:
                                                                        getHorizontalSize(
                                                                            278),
                                                                    margin: getMargin(
                                                                        top: 2,
                                                                        right:
                                                                            5),
                                                                    child: Text(
                                                                        "Sure! Please provide me with your shipment tracking number, and I'll check its status for you.",
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
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600))
                                                    ])))
                                      ])),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: getPadding(left: 58, top: 15),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Padding(
                                                    padding: getPadding(top: 3),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("You",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600),
                                                          Container(
                                                              margin: getMargin(
                                                                  top: 7),
                                                              padding:
                                                                  getPadding(
                                                                      left: 16,
                                                                      top: 4,
                                                                      right: 16,
                                                                      bottom:
                                                                          4),
                                                              decoration: AppDecoration
                                                                  .fillDeeppurple50
                                                                  .copyWith(
                                                                      borderRadius:
                                                                          BorderRadiusStyle
                                                                              .customBorderTR16),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                        margin:
                                                                            getMargin(
                                                                          right:
                                                                              3,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: getPadding(
                                                                              top: 8,
                                                                              bottom: 8,
                                                                              left: 16,
                                                                              right: 16),
                                                                          child: Text(
                                                                              "#202022194",
                                                                              maxLines: null,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtAvenirRegular16),
                                                                        ))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 8),
                                                              child: Text(
                                                                  "lbl_09_55_am"
                                                                      .tr,
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
                                                imagePath: ImageConstant
                                                    .imgEllipse2450x50,
                                                height: getSize(50),
                                                width: getSize(50),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(25)),
                                                margin: getMargin(
                                                    left: 8, bottom: 55))
                                          ]))),
                              Padding(
                                  padding: getPadding(top: 15, right: 31),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: getSize(50),
                                            width: getSize(50),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorConstant.gray200),
                                            child: Padding(
                                              padding: getPadding(all: 13),
                                              child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgmessegeBlackIcon,
                                                height: getSize(24),
                                                width: getSize(24),
                                              ),
                                            )),
                                        Expanded(
                                            child: Padding(
                                                padding:
                                                    getPadding(left: 8, top: 4),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("Chatbot",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtFootnoteGray600),
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  307),
                                                          margin:
                                                              getMargin(top: 6),
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
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                    width:
                                                                        getHorizontalSize(
                                                                            269),
                                                                    margin: getMargin(
                                                                        top: 2,
                                                                        right:
                                                                            5),
                                                                    child: Text(
                                                                        "Your shipment with tracking number #202022194 is currently in transit and is expected to be delivered on Sat 18 Jun 2023. It is currently at Shipped. ",
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
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600))
                                                    ])))
                                      ])),
                            ]),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: ColorConstant.whiteA700,
                      padding:
                          getPadding(left: 16, right: 16, bottom: 40, top: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                                  controller: controller.messagefourController,
                                  hintText: "lbl_massage".tr,
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
}
