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

  Future<bool> _getRecevoirArgentStatus() async {
  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('orders')
        .doc(widget.orderData.docID)
        .get();

    return doc.get('recevoirArgent') ?? false;
  } catch (e) {
    print('Erreur lors de la récupération de recevoirArgent: $e');
    return false;
  }
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
                                  Text('${widget.orderData.cout} FCFA',
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
                            child: Text("Détails de la commande".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFProTextBold20)),
                          Padding(
                            padding: getPadding(top: 21),
                            child: Text("Date de commande".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text( DateFormat('dd/MM/yyyy HH:mm').format(widget.orderData.date),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),

                        Padding(
                            padding: getPadding(top: 21),
                            child: Text("Date de recuperation du colis".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text( DateFormat('dd/MM/yyyy HH:mm').format(widget.orderData.dateRecup),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),

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
                            child: Text("Type de service".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text(widget.orderData.typeServive,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        
                        Padding(
                            padding: getPadding(top: 22),
                            child: Text("Type de Colis".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text(widget.orderData.typeColis,
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
                            child: Text("Statut".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                       Padding(
                          padding: getPadding(top: 10),
                          child: Text(
                            widget.orderData.status!.toLowerCase() == "delivered"
                              ? "Livré"
                              : widget.orderData.status!.toLowerCase() == "canceled"
                                ? "Annulé"
                                : widget.orderData.status!.toLowerCase() == "pending"
                                  ? "En attente"
                                  : "En transit",
                            style: widget.orderData.status!.toLowerCase() == "delivered"
                              ? AppStyle.txtOutfitRegular16Green // Texte vert pour "Livré"
                              : widget.orderData.status!.toLowerCase() == "canceled"
                                ? AppStyle.txtOutfitRegular16Red // Texte bleu pour "En transit"
                                : widget.orderData.status!.toLowerCase() == "pending"
                                  ? AppStyle.txtOutfitRegular14Amber // Texte jaune pour "En attente"
                                  : AppStyle.txtOutfitBlue, // Texte rouge pour "Annulé"
                          ),
                        ),

                         Padding(
                            padding: getPadding(top: 22),
                            child: Text("Mode de payement".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text(widget.orderData.modePayment,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),

                         Padding(
                            padding: getPadding(top: 22),
                            child: Text("Status de payement".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text( 
                                  widget.orderData.payemenStatus == "canceled" 
                                    ? "Annulé" 
                                    : widget.orderData.payemenStatus == "pending" 
                                      ? "En attente" 
                                      : widget.orderData.payemenStatus == "completed" 
                                        ? "Payer" 
                                        : "En attente", 
                                  style: widget.orderData.payemenStatus == "canceled" 
                                    ? AppStyle.txtOutfitRegular14Red // Texte bleu pour "onTheWay" 
                                    : widget.orderData.payemenStatus == "pending" 
                                      ? AppStyle.txtOutfitRegular14Amber // Texte jaune pour "pending" 
                                      : widget.orderData.payemenStatus == "completed" 
                                        ? AppStyle.txtOutfitRegular14Green // Texte vert pour "delivered" 
                                        : AppStyle.txtOutfitBlue, // Texte rouge par défaut 
                                ), 
                                ),

                                FutureBuilder<bool>(
                        future: _getRecevoirArgentStatus(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Erreur lors de la récupération des données'));
                          } else if (snapshot.hasData && snapshot.data == true) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getVerticalSize(16),
                                  ),
                                  Divider(
                                      height: getVerticalSize(1),
                                      thickness: getVerticalSize(1),
                                      color: ColorConstant.gray300),
                                  SizedBox(
                                    height: getVerticalSize(8),
                                  ),
                                  Padding(
                                      padding: getPadding(top: 22),
                                      child: Text("Montant à recevoir".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBodyGray600)),
                                  Padding(
                                      padding: getPadding(top: 10, bottom: 0),
                                      child: Text(widget.orderData.montantRecevoir,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody)),
                                  Padding(
                                      padding: getPadding(top: 22),
                                      child: Text("Mode de réception".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBodyGray600)),
                                  Padding(
                                      padding: getPadding(top: 10, bottom: 0),
                                      child: Text(widget.orderData.modePaiement,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody)),
                                  Padding(
                                      padding: getPadding(top: 22),
                                      child: Text("Numéro de téléphone".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBodyGray600)),
                                  Padding(
                                      padding: getPadding(top: 10, bottom: 0),
                                      child: Text(widget.orderData.numeroDeReception,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody)),
                                  Padding(
                                      padding: getPadding(top: 22),
                                      child: Text("Statut de la transaction".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBodyGray600)),
                                  Padding(
                                      padding: getPadding(top: 10, bottom: 0),
                                      child: Text('',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody)),
                                ],
                              ),
                            );
                          } else {
                            return SizedBox(); // Return an empty widget if `recevoirArgent` is false
                          }
                        },
                      ),

                      // Autres widgets ici...
                    ],

                      //           SizedBox(
                      //     height: getVerticalSize(16),
                      //   ),

                      //           Divider(
                      //       height: getVerticalSize(1),
                      //       thickness: getVerticalSize(1),
                      //       color: ColorConstant.gray300),
                      //   SizedBox(
                      //     height: getVerticalSize(8),
                      //   ),

                      //    Padding(
                      //       padding: getPadding(top: 22),
                      //       child: Text("Montant à recevoir".tr,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtBodyGray600)),
                      //   Padding(
                      //       padding: getPadding(top: 10, bottom: 0),
                      //       child: Text(widget.orderData.montantRecevoir,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtBody)),


                      //    Padding(
                      //       padding: getPadding(top: 22),
                      //       child: Text("Mode de reception".tr,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtBodyGray600)),
                      //   Padding(
                      //       padding: getPadding(top: 10, bottom: 0),
                      //       child: Text(widget.orderData.modePaiement,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtBody)),
                       
                      //  Padding(
                      //       padding: getPadding(top: 22),
                      //       child: Text("Numéro de téléphone".tr,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtBodyGray600)),
                      //   Padding(
                      //       padding: getPadding(top: 10, bottom: 0),
                      //       child: Text(widget.orderData.numeroDeReception,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtBody)),

                      //  Padding(
                      //       padding: getPadding(top: 22),
                      //       child: Text("Status de la transaction".tr,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtBodyGray600)),
                      //   Padding(
                      //       padding: getPadding(top: 10, bottom: 0),
                      //       child: Text(widget.orderData.orderID,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.left,
                      //           style: AppStyle.txtBody)),

                      //],
                    )),
                bottomNavigationBar: Padding(
                    padding: getPadding(left: 16, right: 16, bottom: 40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
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

  }

  onTapTrackorder() {
    Get.toNamed(
      AppRoutes.trackingDetailsScreen,
      arguments: {
      'orderId': widget.orderData.orderID, // Numéro de commande
      'docID': widget.orderData.docID, // Numéro de commande
      'dateRegister': widget.orderData.date, // Date de la commande
      'status': widget.orderData.status, 
      'deliveryId': widget.orderData.deliveryID, 

      },);
  }

  onTapArrowleft18() {
    Get.back();
  }
}
