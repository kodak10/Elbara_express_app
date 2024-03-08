import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/order_tracking_controller.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  OrderTrackingController controller = Get.put(OrderTrackingController());

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

 final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
     User? user = FirebaseAuth.instance.currentUser;
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
                        onTapArrowleft11();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "lbl_order_tacking".tr),
                  styleType: Style.bgFillWhiteA700),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(left: 16, right: 16, bottom: 8),
                      child: Text("msg_ongoing_shipments".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFProTextBold20)),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('commande')
                          .where('userID', isEqualTo: user?.uid)
                          .where('status',isEqualTo: 'en cours') // Filtrer par statut de la commande
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Erreur : ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        List<DocumentSnapshot> documents =
                            snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = documents[index];
                              var document = snapshot.data!.docs[index];
                              var orderId = document.id;
                              var data = document.data() as Map<String, dynamic>;
                              String name = documents[index].get('nomDeLaPersonne');
                            return Padding(
                              padding: getPadding(
                                  top: 8, bottom: 8, left: 16, right: 16),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                              AppRoutes.trackingDetailsScreen,
                                              arguments: {
                                                'name': data['nomDeLaPersonne'], // Nom de la personne
                                                'orderID': orderId, // Numéro de commande
                                                'status': data['status'], // Statut de la commande
                                                'date': data['date'].toDate(), // Date de la commande
                                                // Vous pouvez ajouter d'autres informations de la commande ici
                                              },);
                                  // Naviguer vers les détails de la commande
                                  // Utilisez doc pour accéder aux données de la commande
                                  //Get.toNamed(AppRoutes.trackingDetailsScreen);
                                },
                                child: Container(
                                  decoration: AppDecoration.fillGray50.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8),
                                  child: Padding(
                                    padding: getPadding(all: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CustomIconButton(
                                                height: getSize(64),
                                                width: getSize(64),
                                                shape: IconButtonShape
                                                    .CircleBorder32,
                                                padding: IconButtonPadding
                                                    .PaddingAll14,
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdownDeepPurple600)),
                                            SizedBox(
                                              width: getHorizontalSize(16),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  orderId,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtHeadline,
                                                ),
                                                SizedBox(
                                                  height: getVerticalSize(6),
                                                ),
                                                // Text(
                                                //   "Order id : ${doc['name']}",
                                                //   overflow:
                                                //       TextOverflow.ellipsis,
                                                //   textAlign: TextAlign.left,
                                                //   style: AppStyle.txtFootnote,
                                                // )
                                              ],
                                            )
                                          ],
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgArrowright,
                                          height: getSize(20),
                                          width: getSize(20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }

  onTapArrowleft11() {
    Get.back();
  }
}
