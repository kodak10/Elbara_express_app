import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                            stream: FirebaseFirestore.instance.collection('compagnie').snapshots(),
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
                            },
                          ),
                        
                                    
                                    )));
                      }

  onTapArrowleft14() {
    Get.back();
  }
}
