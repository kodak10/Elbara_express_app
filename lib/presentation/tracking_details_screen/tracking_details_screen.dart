import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/live_tracking_one_screen/live_tracking_one_screen.dart';
import 'package:elbara_express/presentation/live_tracking_screen/live_tracking_screen.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class TrackingDetailsScreen extends StatefulWidget {
  final String docID;

  const TrackingDetailsScreen({Key? key, required this.docID})
      : super(key: key);

  @override
  State<TrackingDetailsScreen> createState() => _TrackingDetailsScreenState();
}

class _TrackingDetailsScreenState extends State<TrackingDetailsScreen> {
  late String statusOrderConfirmed = '';
  late String statusOrderDeliveryConfirmed = '';
  late String statusOrderDelivered = '';
  late String deliveryConfirm = '';
 // late String deliveryID = '';

  String displayName = '';
  String phoneNumber = '';

  bool orderConfirmed = false;
  bool orderDeliveryConfirmed = false;
  bool orderDelivered = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    fetchOrderDetails();
    super.initState();
  }

  void fetchOrderDetails() async {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String docID = args['docID'] ?? '';

    print('document id: $docID');

    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .doc(docID)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          orderConfirmed = documentSnapshot['order_confirm'];
          orderDeliveryConfirmed = documentSnapshot['order_on_delivery'];
          orderDelivered = documentSnapshot['order_delivered'];

          print('Order confirmed: $orderConfirmed');
          print('Order delivery confirmed: $orderDeliveryConfirmed');
          print('Order delivered: $orderDelivered');

          if (orderConfirmed) {
            Timestamp orderConfirmTimestamp =
                documentSnapshot['order_confirm_date'];

            DateTime orderConfirmDate = orderConfirmTimestamp.toDate();
            statusOrderConfirmed =
                DateFormat('dd/MM/yyyy HH:mm:ss').format(orderConfirmDate);

            print('date: $statusOrderConfirmed');
          } else {
            statusOrderConfirmed = 'En attente';
          }

          if (orderDeliveryConfirmed) {
            Timestamp orderDeliveryConfirmedTimestamp =
                documentSnapshot['order_on_delivery_date'];
            DateTime orderDeliveryConfirmedDate =
                orderDeliveryConfirmedTimestamp.toDate();

            statusOrderDeliveryConfirmed = DateFormat('dd/MM/yyyy HH:mm:ss')
                .format(orderDeliveryConfirmedDate);

            deliveryConfirm = "Colis en transit";
          } else {
            statusOrderDeliveryConfirmed = 'En attente';
            deliveryConfirm = "En attente";
          }

          if (orderDelivered) {
            Timestamp orderDeliveredTimestamp =
                documentSnapshot['order_delivered_date'];
            DateTime orderDeliveredDate = orderDeliveredTimestamp.toDate();
            statusOrderDelivered =
                DateFormat('dd/MM/yyyy HH:mm:ss').format(orderDeliveredDate);
            deliveryConfirm =
                DateFormat('dd/MM/yyyy HH:mm:ss').format(orderDeliveredDate);
          } else {
            statusOrderDelivered = 'En attente';
          }
        });
      }
    } catch (e) {
      print('Erreur lors de la récupération des détails de la commande: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    //final Map<String, dynamic> args = Get.arguments ?? {};
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String orderID = args?['orderId'] ?? '';
    final String status = args?['status'] ?? '';

    final String deliveryID = args?['deliveryId'] ?? '';

    DateTime dateCommandeDateTime = args?['dateRegister'] as DateTime;
    // Formatter la date
    String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(dateCommandeDateTime);

    // Votre code de construction de widget continue ici

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
                    title: AppbarSubtitle1(text: ""),
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
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(orderID,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle.txtHeadline),
                                              Container(
                                                  margin: getMargin(top: 12),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                "Date: $formattedDate",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: AppStyle
                                                                    .txtFootnote)),
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
                                          visible: status == "onTheWay",
                                          child: Padding(
                                            padding:
                                                getPadding(left: 8, right: 8),
                                            child: CustomButton(
                                              height: getVerticalSize(40),
                                              width: getHorizontalSize(143),
                                              text: "Suivre le livreur".tr,
                                              margin:
                                                  getMargin(left: 8, bottom: 8),
                                              padding:
                                                  ButtonPadding.PaddingAll11,
                                              fontStyle: ButtonFontStyle
                                                  .SFProTextBold15WhiteA700,
                                              onTap: () {
                                                print(
                                                    'deliveryID: $deliveryID');
                                                Get.to(
                                                  () => LiveTrackingOneScreen(
                                                      deliveryID: deliveryID),
                                                );

                                                //onTapLivetracking();
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
                                                padding: getPadding(top: 8),
                                                child: Text(
                                                    "Terminé le: $statusOrderConfirmed",
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
                                            Text("En Attente du Livreur".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline),
                                            Padding(
                                                padding: getPadding(top: 13),
                                                child: Text(
                                                    "Terminé le: $statusOrderDeliveryConfirmed",
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
                                            Text("Livreur en transit".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline),
                                            Padding(
                                                padding: getPadding(top: 15),
                                                child: Text(
                                                    "Terminé le: $deliveryConfirm",
                                                    //deliveryConfirm,
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
                                            Text("Colis livré".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline),
                                            Padding(
                                                padding: getPadding(top: 13),
                                                child: Text(
                                                    "Livré le: $statusOrderDelivered",
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
