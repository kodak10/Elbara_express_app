import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/cancel_order_screen/cancel_order_screen.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../home_container_page/models/recently_shipped_data_model.dart';
import 'controller/order_details_in_transit_controller.dart';

// ignore: must_be_immutable
class OrderDetailsInTransitScreen extends StatefulWidget {
  OrderDetailsInTransitScreen({Key? key, required this.orderData})
      : super(key: key);
  RecentlyShipped orderData;



  @override
  State<OrderDetailsInTransitScreen> createState() =>
      _OrderDetailsInTransitScreenState();
}

class _OrderDetailsInTransitScreenState
    extends State<OrderDetailsInTransitScreen> {

      
  OrderDetailsInTransitController controler =
      Get.put(OrderDetailsInTransitController());

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
                          onTapArrowleft18();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_order_details".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Container(
                    padding: getPadding(top: 24, bottom: 8),
                    child: ListView(
                      padding: getPadding(left: 16, right: 16),
                      children: [
                        Padding(
                            padding: getPadding(top: 3),
                            child: Text("Adresse de ramassage".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(left: 2, top: 12),
                            child: Text(widget.orderData.depart,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        Padding(
                            padding: getPadding(top: 19),
                            child: Text("Adresse de livraison".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(left: 2, top: 11, bottom: 16),
                            child: Text(widget.orderData.destination,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray300),
                        SizedBox(
                          height: getVerticalSize(8),
                        ),
                       
                        
                        Padding(
                            padding: getPadding(top: 16, bottom: 16),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Coût:".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold20),
                                  Text('${widget.orderData.cout}',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold20)
                                ])),
                        SizedBox(
                          height: getVerticalSize(8),
                        ),
                        Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray300),

                        Padding(
                            padding: getPadding(top: 32),
                            child: Text("Details de la commande".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFProTextBold20)),
                        Padding(
                            padding: getPadding(top: 22),
                            child: Text("Référence du colis".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text(widget.orderData.orderID,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        Padding(
                            padding: getPadding(top: 22),
                            child: Text("Type de course".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text(widget.orderData.typCourse,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),

                       


                        Padding(
                            padding: getPadding(top: 22),
                            child: Text("Type d'engin".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text(widget.orderData.typeEngin,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                       
                        Padding(
                            padding: getPadding(top: 20),
                            child: Text("Status de la livraison".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10),
                            child: Text(
                              widget.orderData.status!,
                              style: widget.orderData.status!.toLowerCase() ==
                                      "Livrer"
                                  ? AppStyle.txtOutfitRegular16Green
                                  : widget.orderData.status!.toLowerCase() ==
                                          "En chemin"
                                      ? AppStyle.txtOutfitRegular16Amber
                                      : AppStyle.txtOutfitRegular16Red,
                            )
                            //
                            // Text("lbl_in_transit".tr,
                            //     overflow: TextOverflow.ellipsis,
                            //     textAlign: TextAlign.left,
                            //     style: AppStyle.txtSFProTextSemibold16)
                            ),
                        Padding(
                            padding: getPadding(top: 21),
                            child: Text("Date de commande".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text(DateFormat('yyyy-MM-dd HH:mm').format(widget.orderData.date),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody))
                      ],
                    )),
                bottomNavigationBar: Padding(
                    padding: getPadding(left: 16, right: 16, bottom: 40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // CustomButton(
                          //     height: getVerticalSize(54),
                          //     width: getHorizontalSize(190),
                          //     text: "Annuler".tr,
                          //     variant: ButtonVariant.OutlineDeeppurple600,
                          //     fontStyle:
                          //         ButtonFontStyle.SFProTextBold18Deeppurple600,
                          //     onTap: widget.orderData.status!.toLowerCase() ==
                          //                 "delivered" ||
                          //             widget.orderData.status!.toLowerCase() ==
                          //                 "cancelled"
                          //         ? () {
                          //             Fluttertoast.showToast(
                          //                 msg: widget.orderData.status!
                          //                             .toLowerCase() ==
                          //                         "delivered"
                          //                     ? "Your order is deliverd"
                          //                     : "Your order is already cancel",
                          //                 toastLength: Toast.LENGTH_SHORT,
                          //                 gravity: ToastGravity.CENTER,
                          //                 timeInSecForIosWeb: 1,
                          //                 backgroundColor: Colors.black,
                          //                 textColor: Colors.white,
                          //                 fontSize: 16.0);
                          //           }
                          //         : () {
                          //             onTapCancelorder();
                          //           }),
                          CustomButton(
                            height: getVerticalSize(54),
                            width: getHorizontalSize(190),
                            text: "Annuler".tr,
                            variant: ButtonVariant.OutlineDeeppurple600,
                            fontStyle: ButtonFontStyle.SFProTextBold18Deeppurple600,
                            onTap: () async {
                              if (widget.orderData.status!.toLowerCase() == "delivered" ||
                                  widget.orderData.status!.toLowerCase() == "cancelled") {
                                // Afficher un message indiquant que la commande est déjà livrée ou annulée
                                Fluttertoast.showToast(
                                  msg: widget.orderData.status!.toLowerCase() == "delivered"
                                      ? "Votre commande est déjà livrée"
                                      : "Votre commande est déjà annulée",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              } else {
                                // Mettre à jour le statut de la commande dans Firebase
                                try {
                                  await FirebaseFirestore.instance
                                      .collection('orders')
                                      .doc(widget.orderData.docID)
                                      .update({'deliveryStatus': 'canceled'});
                                  // Afficher un message de succès
                                  Fluttertoast.showToast(
                                    msg: "Votre commande a été annulée avec succès",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                } catch (error) {
                                  // Gérer les erreurs éventuelles
                                  print('Erreur lors de l\'annulation de la commande: $error');
                                  // Afficher un message d'erreur
                                  Fluttertoast.showToast(
                                    msg: "Erreur lors de l'annulation de la commande",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }
                              }
                            },
                          ),

                          CustomButton(
                              height: getVerticalSize(54),
                              width: getHorizontalSize(190),
                              text: "Suivre".tr,
                              margin: getMargin(left: 16),
                              onTap: () {
                                onTapTrackorder();
                              })
                        ])))));
  }

  onTapCancelorder() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          content: CancelOrderScreen(),
        );
      },
    );
    // Get.toNamed(
    //  AppRoutes.cancelOrderScreen,
    // );
  }

  onTapTrackorder() {
  

    Get.toNamed(
                                    AppRoutes.trackingDetailsScreen,
                                      arguments: {
                                        'orderId': widget.orderData.date, // Numéro de commande
                                        'docID': widget.orderData.docID, // Numéro de commande
                                        //'date': widget.orderData.date, // Date de la commande
                                        //'dateRegister': widget.orderData.dateString,
                                        'status': widget.orderData.status, 
                                        
                                        
                                      },);
  }

  onTapArrowleft18() {
    Get.back();
  }
}
