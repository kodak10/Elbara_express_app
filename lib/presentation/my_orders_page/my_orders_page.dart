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
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Commandes"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('commande')
            .where('userID', isEqualTo: user?.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildEmptyState();
          }

          return _buildOrderList(snapshot.data!.docs);
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Vous n'avez pas encore passé de commandes.",
            style: AppStyle.txtSFProTextBold28,
          ),
          CustomButton(
            text: "Passer une commande",
            onTap: () {
              // Action lorsque l'utilisateur appuie sur le bouton pour passer une commande
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList(List<DocumentSnapshot> documents) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) {
        var document = documents[index];
        var orderId = document.id;
        var orderData = document.data() as Map<String, dynamic>;
        // Ici, vous pouvez utiliser les données de la commande, telles que orderData['nom'], orderData['date'], etc.
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstant.gray50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(
                "Commande: $orderId",
                style: AppStyle.txtSFProTextBold20,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nom: ${orderData['nom']}",
                    style: AppStyle.txtSFProTextRegular17,
                  ),
                  Text(
                    "Date: ${orderData['date']}",
                    style: AppStyle.txtSFProTextRegular17,
                  ),
                  // Ajoutez d'autres détails de la commande ici
                ],
              ),
              // Afficher d'autres détails de la commande ici
            ),
          ),
        );
      },
    );
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
