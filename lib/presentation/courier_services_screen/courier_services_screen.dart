import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import '../home_container_page/controller/home_container_controller.dart';
import 'controller/courier_services_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CourierServicesScreen extends StatefulWidget {
  const CourierServicesScreen({Key? key}) : super(key: key);

  @override
  State<CourierServicesScreen> createState() => _CourierServicesScreenState();
}

class _CourierServicesScreenState extends State<CourierServicesScreen> {
  CourierServicesController courierServicesController =
      Get.put(CourierServicesController());
  HomeContainerController homeContainerController =
      Get.put(HomeContainerController());

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
                        onTapArrowleft14();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "Nos compagnies".tr),
                  styleType: Style.bgFillWhiteA700),
              body: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('compagnie')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                        padding: getPadding(left: 8, right: 8),
                        itemCount:
                            4, // Afficher 4 shimmers pendant le chargement
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: getPadding(left: 8, right: 8),
                            child: Container(
                              width: getSize(236),
                              decoration: BoxDecoration(
                                color: ColorConstant.gray50,
                                borderRadius:
                                    BorderRadius.circular(getHorizontalSize(8)),
                              ),
                              child: compagniesShimmer(),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Erreur de chargement des données');
                    } else {
                      List<DocumentSnapshot> documents = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          // Adaptation nécessaire en fonction de la structure de vos données
                          String companyName = documents[index].get('name');
                          String companyLogoUrl = documents[index].get('logo');
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(companyLogoUrl),
                            ),
                            title: Text(companyName),
                          );
                        },
                      );
                    }
                    
                  }),
            )));
  }

  Shimmer compagniesShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: getPadding(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: getSize(20), // Rayon simulant la taille du cercle
              backgroundColor:
                  Colors.white, // Couleur simulant le fond du cercle
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: getSize(100), // Largeur simulant la taille du texte
              height: getSize(20), // Hauteur simulant la taille du texte
              color: Colors.white, // Couleur simulant le fond du texte
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowleft14() {
    Get.back();
  }
}
