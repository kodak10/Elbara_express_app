import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../home_container_page/controller/home_container_controller.dart';
import '../home_container_page/models/recently_shipped_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';



class RecentlyShippedScreen extends StatefulWidget {
  const RecentlyShippedScreen({Key? key}) : super(key: key);
 

  @override
  State<RecentlyShippedScreen> createState() => _RecentlyShippedScreenState();
}

class _RecentlyShippedScreenState extends State<RecentlyShippedScreen> {
  HomeContainerController controller = Get.put(HomeContainerController());

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
