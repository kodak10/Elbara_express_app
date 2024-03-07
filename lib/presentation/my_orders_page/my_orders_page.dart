// import '../home_container_page/controller/home_container_controller.dart';
// import '../home_container_page/models/recently_shipped_data_model.dart';
// import '../my_orders_page/widgets/my_orders_item_widget.dart';
// import 'controller/my_orders_controller.dart';
// import 'package:elbara_express/core/app_export.dart';
// import 'package:elbara_express/widgets/custom_button.dart';
// import 'package:flutter/material.dart';

// class MyOrdersPage extends StatefulWidget {
//   const MyOrdersPage({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   State<MyOrdersPage> createState() => _MyOrdersPageState();
// }

// class _MyOrdersPageState extends State<MyOrdersPage> {
//   MyOrdersController myOrdersController = Get.put(MyOrdersController());
//   HomeContainerController controller = Get.put(HomeContainerController());
//   @override
//   Widget build(BuildContext context) {
//     return controller.recentlyShipped.isEmpty
//         ? SizedBox(
//             width: double.maxFinite,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: double.maxFinite,
//                   child: Container(
//                     padding: getPadding(
//                       left: 142,
//                       top: 19,
//                       right: 142,
//                       bottom: 19,
//                     ),
//                     decoration: AppDecoration.white,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: getPadding(
//                             top: 5,
//                           ),
//                           child: Text(
//                             "Mes Commandes".tr,
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: AppStyle.txtSFProTextBold28,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Spacer(),
//                 Card(
//                   clipBehavior: Clip.antiAlias,
//                   elevation: 0,
//                   margin: EdgeInsets.all(0),
//                   color: ColorConstant.deepPurple50,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadiusStyle.circleBorder70,
//                   ),
//                   child: Container(
//                     height: getSize(
//                       140,
//                     ),
//                     width: getSize(
//                       140,
//                     ),
//                     padding: getPadding(
//                       all: 30,
//                     ),
//                     decoration: AppDecoration.fillDeeppurple50.copyWith(
//                       borderRadius: BorderRadiusStyle.circleBorder70,
//                     ),
//                     child: Stack(
//                       children: [
//                         CustomImageView(
//                           svgPath: ImageConstant.imgPackage11,
//                           height: getSize(
//                             80,
//                           ),
//                           width: getSize(
//                             80,
//                           ),
//                           alignment: Alignment.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: getPadding(
//                     top: 21,
//                   ),
//                   child: Text(
//                     "lbl_no_order_yet".tr,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: AppStyle.txtSFProTextBold22,
//                   ),
//                 ),
//                 Container(
//                   width: getHorizontalSize(
//                     270,
//                   ),
//                   margin: getMargin(
//                     top: 12,
//                   ),
//                   child: Text(
//                     "msg_pellentesque_eu".tr,
//                     maxLines: null,
//                     textAlign: TextAlign.center,
//                     style: AppStyle.txtBody,
//                   ),
//                 ),
//                 CustomButton(
//                   height: getVerticalSize(
//                     53,
//                   ),
//                   width: getHorizontalSize(
//                     178,
//                   ),
//                   text: "lbl_add".tr,
//                   margin: getMargin(
//                     top: 41,
//                     bottom: 194,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Container(
//             decoration: AppDecoration.white,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: double.maxFinite,
//                   child: Container(
//                     padding: getPadding(
//                       left: 142,
//                       top: 19,
//                       right: 142,
//                       bottom: 19,
//                     ),
//                     decoration: AppDecoration.white,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: getPadding(
//                             top: 5,
//                           ),
//                           child: Text(
//                             "lbl_my_orders".tr,
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: AppStyle.txtSFProTextBold28,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: getPadding(bottom: 20),
//                     child: Container(
//                       child: ListView(
//                         children: [
//                           ListView.separated(
//                             padding: getPadding(
//                                 left: 16, top: 16, right: 16, bottom: 20),
//                             physics: BouncingScrollPhysics(),
//                             shrinkWrap: true,
//                             separatorBuilder: (
//                               context,
//                               index,
//                             ) {
//                               return SizedBox(
//                                 height: getVerticalSize(
//                                   16,
//                                 ),
//                               );
//                             },
//                             itemCount: controller.recentlyShipped.length,
//                             itemBuilder: (context, index) {
//                               RecentlyShipped model =
//                                   controller.recentlyShipped[index];
//                               return MyOrdersItemWidget(
//                                 model,
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
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
                        onTapArrowleft15();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "Mes Commandes".tr),
                  styleType: Style.bgFillWhiteA700),
              body: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                    .collection('commande')
                    .where('userID', isEqualTo: user?.uid)
                    .where('status', isEqualTo: 'en cours') // Filtrer par statut de la commande
                    //.orderBy('date', descending: true) // Trier par date de commande, les plus récents en premier
                    .limit(5) // Limiter à 5 commandes
                    .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Erreur: ${snapshot.error}'),
                      );
                    }
                    List<DocumentSnapshot> documents = snapshot.data!.docs;
                    
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        // var orderId = documents.id;
                        // var data = documents.data() as Map<String, dynamic>;
                        // Adaptation nécessaire en fonction de la structure de vos données
                       // String orderID = documents[index].get('orderID');
                        String name = documents[index].get('nomDeLaPersonne');
                        //String date = documents[index].get('date');
                        String status = documents[index].get('status');
                        bool isCompleted = status == 'terminé';
  
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_downward),
                                      SizedBox(width: 8),
                                      Text(
                                        'Expédié à: $name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  //Text('Numéro de commande: $orderID'),
                                  // Text(
                                  //   "Date et heure de commande: ${DateFormat("d MMMM y à HH:mm:ss").format(data['date'].toDate())}",
                                  //   ),
                                  //Text('ID de commande: $orderID'),
                                  // Text(
                                  //   "Date et heure de commande: ${DateFormat("d MMMM y à HH:mm:ss").format(data['date'].toDate())}",
                                  //   ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Statut de la commande: $status',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  if (!isCompleted)
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.trackingDetailsScreen);

                                      },
                                      child: Text('Suivre la Commande'),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
            )));
  }

  onTapTrackpackage() {
    Get.toNamed(AppRoutes.trackingDetailsTwoScreen);
  }

  onTapArrowleft15() {
    Get.back();
  }
}



// FIREBASE

// import 'package:flutter/material.dart';
// import 'package:elbara_express/core/app_export.dart';
// import 'package:elbara_express/widgets/custom_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MyOrdersPage extends StatefulWidget {
//   const MyOrdersPage({Key? key}) : super(key: key);

//   @override
//   State<MyOrdersPage> createState() => _MyOrdersPageState();
// }

// class _MyOrdersPageState extends State<MyOrdersPage> {
//   final User? user = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Mes Commandes"),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('commande')
//             .where('userID', isEqualTo: user?.uid)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Vous n'avez pas encore passé de commandes."),
//                   CustomButton(
//                     text: "Passer une commande",
//                     onTap: () {
//                       // Action lorsque l'utilisateur appuie sur le bouton pour passer une commande
//                     },
//                   ),
//                 ],
//               ),
//             );
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               var document = snapshot.data!.docs[index];
//               var orderId = document.id;
//               var orderData = document.data() as Map<String, dynamic>;
//               // Ici, vous pouvez utiliser les données de la commande, telles que orderData['nom'], orderData['date'], etc.
//               return ListTile(
//                 title: Text("Commande: $orderId"),
//                 // Afficher d'autres détails de la commande ici
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
