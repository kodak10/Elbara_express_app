import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class TrackingDetailsScreen extends StatefulWidget {
  final String orderId;

  const TrackingDetailsScreen({Key? key, required this.orderId}) : super(key: key);

  //const TrackingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TrackingDetailsScreen> createState() => _TrackingDetailsScreenState();
}

class _TrackingDetailsScreenState extends State<TrackingDetailsScreen> {
  @override
  late DocumentSnapshot orderSnapshot;


  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  void fetchOrderDetails() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('commande')
          .doc(widget.orderId)
          .get();

      setState(() {
        orderSnapshot = documentSnapshot;
      });
    } catch (e) {
      print('Error fetching order details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String name = args['name'] ?? '';
    final String orderID = args['orderID'] ?? '';
    final String status = args['status'] ?? '';
    //final String dateCommande = args['date'] ?? ''; // Utiliser la clé 'date'



    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
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
                          onTapArrowleft12();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "Suivi de commande"),
                    styleType: Style.bgFillWhiteA700),
                body: Container(
                    width: double.maxFinite,
                    padding: getPadding(all: 16),
                    child: ListView(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  padding: getPadding(all: 16),
                                  decoration: AppDecoration.fillGray50.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8),
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
                                        padding: getPadding(
                                            left: 8, top: 8, bottom: 4),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(orderID,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtHeadline),
                                              Container(
                                                  height: getVerticalSize(16),
                                                  width: getHorizontalSize(140),
                                                  margin: getMargin(top: 12),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                "",//date
                                                                
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtFootnote)
                                                                    ),
                                                        Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Container(
                                                                height:
                                                                    getSize(3),
                                                                width:
                                                                    getSize(3),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            60,
                                                                        top: 5),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .black900,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            getHorizontalSize(1)))))
                                                      ]))
                                            ]))
                                  ])),
                              Container(
                                  height: getVerticalSize(224),
                                  width: getHorizontalSize(396),
                                  margin: getMargin(top: 16),
                                  child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgRectangle4428,
                                            height: getVerticalSize(224),
                                            width: getHorizontalSize(396),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(8)),
                                            alignment: Alignment.center),
                                        Visibility(
                                            visible: status == "livraison",
                                            child: Padding(
                                              padding: getPadding(left: 8, right: 8),
                                              child: CustomButton(
                                                height: getVerticalSize(40),
                                                width: getHorizontalSize(143),
                                                text: "Suivre le livreur".tr,
                                                margin: getMargin(left: 8, bottom: 8),
                                                padding: ButtonPadding.PaddingAll11,
                                                fontStyle: ButtonFontStyle.SFProTextBold15WhiteA700,
                                                onTap: () {
                                                  onTapLivetracking();
                                                },
                                                alignment: Alignment.bottomLeft,
                                              ),
                                            ),
                                          )

                                      ])),
                              Padding(
                                  padding: getPadding(top: 21),
                                  child: Text("Historique de suivi".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold20)),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgTrackingOrder,
                                    height: getSize(318),
                                  ),
                                  SizedBox(width: getHorizontalSize(14)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("Vérification".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline),
                                            Padding(
                                                padding: getPadding(top:13),
                                                child: Text(
                                                    "",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style:
                                                        AppStyle.txtFootnote))
                                          ]),
                                      SizedBox(
                                        height: getVerticalSize(40),
                                      ),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("En transit",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline),
                                            Padding(
                                                padding: getPadding(top: 13),
                                                child: Text(
                                                    "",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style:
                                                        AppStyle.txtFootnote))
                                          ]),
                                      SizedBox(
                                        height: getVerticalSize(40),
                                      ),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("Livraison en cours",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline),
                                            Padding(
                                                padding: getPadding(top: 13),
                                                child: Text(
                                                    "",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style:
                                                        AppStyle.txtFootnote))
                                          ]),
                                      SizedBox(
                                        height: getVerticalSize(40),
                                      ),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("Colis livré",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline),
                                            Padding(
                                                padding: getPadding(top: 13),
                                                child: Text(
                                                    "",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style:
                                                        AppStyle.txtFootnote))
                                          ])
                                    ],
                                  )
                                ],
                              ),
                            ]),
                      ],
                    )))));
  }

  onTapLivetracking() {
    Get.toNamed(
      AppRoutes.liveTrackingOneScreen,
    );
  }

  onTapArrowleft12() {
    Get.back();
  }
}
