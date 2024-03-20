import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class OrderDetailsPage  extends StatefulWidget {
  final String orderId;

  const OrderDetailsPage ({Key? key, required this.orderId}) : super(key: key);

  //const TrackingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage > createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage > {
  late DocumentSnapshot? orderSnapshot; // Mettre orderSnapshot comme nullable
  String switchValue = ""; // Valeur initiale du switch
  TextEditingController tailleArticleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstant.whiteA700,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    fetchOrderDetails();
  }

  void fetchOrderDetails() async {
    try {
      if (widget.orderId.isNotEmpty) { // Vérifiez si orderId n'est pas vide avant de faire la requête Firestore
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('commande')
            .doc(widget.orderId)
            .get();

        setState(() {
          orderSnapshot = documentSnapshot;
          switchValue = orderSnapshot?.get('status') ?? "en transit"; // Utiliser ? pour accéder à orderSnapshot
          tailleArticleController.text = orderSnapshot?.get('taille') ?? ''; // Utiliser ? pour accéder à orderSnapshot
        });
      }
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
                    title: AppbarSubtitle1(text: "Details"),
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
                                  
                              
                              Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Expanded(
                                child: Padding(
                                   padding: getPadding(top: 20, bottom:20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nom du client",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline),
                                      CustomTextFormField(
                                        hintText: "Nom du client",
                                       
                                        margin: getMargin(top: 9),
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20), // Adjust as needed
                              Divider(),
                              Expanded(
                                child: Padding(
                                   padding: getPadding(top: 20, bottom:20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Téléphone".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline),
                                      CustomTextFormField(
                                        hintText: "Téléphone",
                                       
                                        margin: getMargin(top: 9),
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                             Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Expanded(
                                child: Padding(
                                   padding: getPadding(top: 20, bottom:20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nom du receptionneur".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline),
                                      CustomTextFormField(
                                        hintText: "Nom du receptionneur",
                                       
                                        margin: getMargin(top: 9),
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20), // Adjust as needed
                              Divider(),
                              Expanded(
                                child: Padding(
                                   padding: getPadding(top: 20, bottom:20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Téléphone".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline),
                                      CustomTextFormField(
                                        hintText: "Téléphone",
                                       
                                        margin: getMargin(top: 9),
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Divider(),

                           Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Expanded(
                                child: Padding(
                                   padding: getPadding(top: 20, bottom:20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Poids".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline),
                                      CustomTextFormField(
                                        hintText: "Poids",
                                       
                                        margin: getMargin(top: 9),
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20), // Adjust as needed
                              Divider(),
                              Expanded(
                                child: Padding(
                                   padding: getPadding(top: 20, bottom:20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Taille".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline),
                                      CustomTextFormField(
                                        hintText: "Taille",
  controller: TextEditingController(text: args['taille'] ?? ''), // Utilisez la valeur de 'taille_article' depuis args comme valeur initiale

                                       
                                        margin: getMargin(top: 9),
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Divider(),
                           Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Expanded(
                                child: Padding(
                                   padding: getPadding(top: 20, bottom:20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Depart".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline),
                                      CustomTextFormField(
                                        hintText: "Depart",
                                       
                                        margin: getMargin(top: 9),
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20), // Adjust as needed
                              Divider(),
                              Expanded(
                                child: Padding(
                                   padding: getPadding(top: 20, bottom:20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Destination".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline),
                                      CustomTextFormField(
                                        hintText: "Destination",
                                       
                                        margin: getMargin(top: 9),
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                            
                            // Switch(
                            //     value: switchValue == "en cours", // Détermine si le switch est activé ou non
                            //     onChanged: (newValue) async {
                            //       setState(() {
                            //         switchValue = newValue ? "en cours" : "en transit";
                            //       });
                            //       print('Il passe ici');
                            //       try {
                            //         print('Il passe ici avant la recherche ID');
                                    
                            //         if (widget.orderId.isNotEmpty) {
                            //           print("Il passe ici s'il a trouver ID");
                            //           await FirebaseFirestore.instance
                            //             .collection('commande')
                            //             .doc(widget.orderId)
                            //             //.update({'status': switchValue}); // Utilisez switchValue au lieu de newValue
                            //             .update({'status': newValue ? "en cours" : "en transit"});

                            //           print('Mise à jour réussie');
                            //         }
                            //       } catch (e) {
                            //         print('Erreur lors de la mise à jour de la valeur du switch: $e');
                            //       }
                                 
                            //     },
                            //   )

                            Center(
                              child: Container(
                                width: double.infinity, // Pour étendre le bouton sur toute la largeur disponible
                                padding: EdgeInsets.symmetric(horizontal: 20), // Ajustez le padding selon vos besoins
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Colis recu ?',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Switch(
                                      value: switchValue == "en cours", // Détermine si le switch est activé ou non
                                      onChanged: (newValue) async {
                                        setState(() {
                                          switchValue = newValue ? "en cours" : "en transit";
                                        });
                                        try {
                                          if (widget.orderId.isNotEmpty) {
                                            await FirebaseFirestore.instance
                                              .collection('commande')
                                              .doc(widget.orderId)
                                              .update({'status': newValue ? "en cours" : "en transit"});
                                            print('Mise à jour réussie');
                                          }
                                        } catch (e) {
                                          print('Erreur lors de la mise à jour de la valeur du switch: $e');
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )




                            
                              //buildTrackingHistory(status),
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
