import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/order_details_in_transit_screen/order_details_in_transit_screen.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../home_container_page/controller/home_container_controller.dart';
import '../home_container_page/models/recently_shipped_data_model.dart';
import '../my_orders_page/widgets/my_orders_item_widget.dart';
import 'controller/my_orders_controller.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key})
      : super(
          key: key,
        );


  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

final User? user = FirebaseAuth.instance.currentUser;

class _MyOrdersPageState extends State<MyOrdersPage> {
  List<RecentlyShipped> recentlyShippedData = [];


  @override
  void initState() {
    super.initState();
    fetchRecentlyShippedData();
  }


@override
final User? user = FirebaseAuth.instance.currentUser;

Future<void> fetchRecentlyShippedData() async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: user!.uid) // Remplacez 'userID' par le nom du champ contenant l'ID de l'utilisateur
        .get();

    setState(() {
      recentlyShippedData = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        String docID = doc.id;

         Timestamp timestamp = data['dateRegister'] as Timestamp;
          DateTime date = timestamp.toDate();

        return RecentlyShipped(
          docID: docID,
          orderID: data['orderId'] ?? '', // Valeur pour l'ID de la commande
          name: data['name'] ?? '', // Valeur pour le nom
          date: date,
          status: data['deliveryStatus'] ?? '', // Valeur pour le statut
          typCourse: data['type_colis'] ?? '', // Valeur pour le statut
          typeEngin: data['selectedVehicle'] ?? '', // Valeur pour le statut
          depart: data['lieu_depart'] ?? '', // Valeur pour le statut
          destination: data['lieu_arrive'] ?? '', // Valeur pour le statut
          payemenStatus: data['paymentMethod'] ?? '', // Valeur pour le statut
          cout: data['price'] ?? '', // Valeur pour le statut


        );
      }).toList();
    });
  } catch (e) {
    print('Erreur lors de la récupération des données: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return recentlyShippedData.isEmpty
        ? SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    padding: getPadding(
                      left: 0,
                      top: 19,
                      right: 0,
                      bottom: 19,
                    ),
                    decoration: AppDecoration.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 5,
                          ),
                          child: Text(
                            "Mes Commandes",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProTextBold28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: ColorConstant.deepPurple50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.circleBorder70,
                  ),
                  child: Container(
                    height: getSize(
                      140,
                    ),
                    width: getSize(
                      140,
                    ),
                    padding: getPadding(
                      all: 30,
                    ),
                    decoration: AppDecoration.fillDeeppurple50.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder70,
                    ),
                    child: Stack(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgPackage11,
                          height: getSize(
                            80,
                          ),
                          width: getSize(
                            80,
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 21,
                  ),
                  child: Text(
                    "lbl_no_order_yet".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFProTextBold22,
                  ),
                ),
                
                CustomButton(
                  height: getVerticalSize(
                    53,
                  ),
                  width: getHorizontalSize(
                    220,
                  ),
                  text: "Envoyer un colis".tr,
                  margin: getMargin(
                    top: 41,
                    bottom: 194,
                  ),
                ),
              ],
            ),
          )
        : Container(
      decoration: AppDecoration.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Container(
              padding: getPadding(
                left: 0,
                top: 19,
                right: 0,
                bottom: 19,
              ),
              decoration: AppDecoration.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Text(
                      "lbl_my_orders".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSFProTextBold28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: getPadding(bottom: 20),
              child: Container(
                child: ListView(
                  children: [
                    ListView.separated(
                      padding: getPadding(
                        left: 16,
                        top: 16,
                        right: 16,
                        bottom: 20
                      ),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                          context,
                          index,
                          ) {
                        return SizedBox(
                          height: getVerticalSize(
                            16,
                          ),
                        );
                      },
                      itemCount: recentlyShippedData.length,
                        itemBuilder: (context, index) {
                          RecentlyShipped model = recentlyShippedData[index];
                          return MyOrdersItemWidget(
                           recentlyShippedData[index],
                          );
                        },

                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
    
  }
}
