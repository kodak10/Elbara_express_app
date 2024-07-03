import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import '../log_out_screen/log_out_screen.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));

  String? _imageUrl; // URL de l'image téléchargée

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    _getUserImage(); // Appel de la fonction pour récupérer l'image de l'utilisateur

  }

// Fonction pour récupérer l'image de l'utilisateur
  Future<void> _getUserImage() async {
    // Récupérer l'utilisateur actuellement connecté
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Récupérer le document de l'utilisateur dans Firestore
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      // Vérifier si le champ 'image' existe dans le document
      if (snapshot.exists && snapshot.data() != null && snapshot.data()!['photoURL'] != null) {
        // Récupérer l'URL de l'image à partir du champ 'image' du document
        setState(() {
          _imageUrl = snapshot.data()!['photoURL'];
        });
      }
    }
  }






  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: getPadding(
                    left: 0,
                    top: 22,
                    right: 0,
                    bottom: 22,
                  ),
                  decoration: AppDecoration.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Mon Profil",
                          textAlign: TextAlign.center,
                          style: AppStyle.txtSFProTextBold28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                
                child: Stack(
                  children: [
                    

                    Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey[200]!, // Couleur de la bordure
          width: 2, // Largeur de la bordure
        ),
        color: Colors.grey[200],
        image: _imageUrl != null
            ? DecorationImage(
                image: NetworkImage(_imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: _imageUrl == null
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                 height: 110,
                 width: 110,
                //color: Colors.white,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[200]!, // Couleur de la bordure
                    width: 2, // Largeur de la bordure
                  ),
                ) // Couleur du shimmer
              ),
            )
          : null, // Pas besoin du shimmer si l'image est prête
    ),
                    
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.codePromo);
                },
                child: Container(
                  margin: getMargin(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.outlineGray200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgTickets,
                        height: getSize(
                          22,
                        ),
                        width: getSize(
                          22,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 8,
                          top: 3,
                        ),
                        child: Text(
                          "Code Promo".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBody,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowrightBlack900,
                        height: getSize(
                          16,
                        ),
                        width: getSize(
                          16,
                        ),
                        margin: getMargin(
                          top: 3,
                          right: 1,
                          bottom: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.profileDetailsScreen);
                },
                child: Container(
                  margin: getMargin(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.outlineGray200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgUser,
                        height: getSize(
                          22,
                        ),
                        width: getSize(
                          22,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 8,
                          top: 3,
                        ),
                        child: Text(
                          "Mon Compte",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBody,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowrightBlack900,
                        height: getSize(
                          16,
                        ),
                        width: getSize(
                          16,
                        ),
                        margin: getMargin(
                          top: 3,
                          right: 1,
                          bottom: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.customerSupportScreen);
                },
                child: Container(
                  margin: getMargin(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.outlineGray200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgIcheadset,
                        height: getSize(
                          22,
                        ),
                        width: getSize(
                          22,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 8,
                          top: 3,
                        ),
                        child: Text(
                          "Service Clients",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBody,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowrightBlack900,
                        height: getSize(
                          16,
                        ),
                        width: getSize(
                          16,
                        ),
                        margin: getMargin(
                          top: 3,
                          right: 1,
                          bottom: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyScreen);
                },
                child: Container(
                  margin: getMargin(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.outlineGray200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowdownBlack900,
                        height: getSize(
                          22,
                        ),
                        width: getSize(
                          22,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 8,
                          top: 3,
                        ),
                        child: Text(
                          "Politique et Confidentialité".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBody,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowrightBlack900,
                        height: getSize(
                          16,
                        ),
                        width: getSize(
                          16,
                        ),
                        margin: getMargin(
                          top: 3,
                          right: 1,
                          bottom: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        insetPadding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        contentPadding: EdgeInsets.zero,
                        content: LogOutScreen(),
                      );
                    },
                  );
                },
                child: Container(
                  margin: getMargin(
                    left: 16,
                    top: 16,
                    right: 16,
                    bottom: 5,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.outlineGray200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgRefresh,
                        height: getSize(
                          22,
                        ),
                        width: getSize(
                          22,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 8,
                          top: 3,
                        ),
                        child: Text(
                          "Se Déconnecter".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBody,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowrightBlack900,
                        height: getSize(
                          16,
                        ),
                        width: getSize(
                          16,
                        ),
                        margin: getMargin(
                          top: 3,
                          right: 1,
                          bottom: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
