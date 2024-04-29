import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

class ProfileDetailsScreen extends StatefulWidget {
  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  late String email = '';
  late String name = '';
  late String phoneNumber = '';
  late String image = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late User _currentUser;
  String? _imageUrl; // URL de l'image téléchargée

  @override
  void initState() {
    _currentUser = FirebaseAuth.instance.currentUser!;
    _loadUserData();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    _getUserImage();
  }

  Future<void> _loadUserData() async {
    if (_currentUser != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser.uid)
          .get();
      if (userData.exists) {
        setState(() {
          email = userData['email'] ?? '';
          name = userData['displayName'] ?? '';
          phoneNumber = userData['contact'] ?? '';
          image = userData['image'] ?? '';
        });
      }
    }
  }

// Fonction pour récupérer l'image de l'utilisateur
  Future<void> _getUserImage() async {
    // Récupérer l'utilisateur actuellement connecté
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Récupérer le document de l'utilisateur dans Firestore
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      // Vérifier si le champ 'image' existe dans le document
      if (snapshot.exists &&
          snapshot.data() != null &&
          snapshot.data()!['image'] != null) {
        // Récupérer l'URL de l'image à partir du champ 'image' du document
        setState(() {
          _imageUrl = snapshot.data()!['image'];
        });
      }
    }
  }

  // Méthode pour choisir une image à partir de la galerie
// Future<void> _pickImage() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     // Enregistrer l'image dans Firebase Storage
//     final imageUrl = await _uploadImageToStorage(pickedFile.path);
    
//     // Mettre à jour l'URL de l'image dans Firestore
//     await _updateUserImageInFirestore(imageUrl);
//   }
// }

// Méthode pour choisir une image à partir de la galerie
Future<void> _pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    // Enregistrer l'image dans Firebase Storage
    final imageUrl = await _uploadImageToStorage(pickedFile.path);
    
    // Mettre à jour l'URL de l'image dans Firestore
    await _updateUserImageInFirestore(imageUrl);

    // Mettre à jour l'URL de l'image dans l'état local
    setState(() {
      _imageUrl = imageUrl;
    });
  }
}



  // Méthode pour télécharger l'image dans Firebase Storage
  Future<String> _uploadImageToStorage(String imagePath) async {
    final firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child(DateTime.now().toString() + '.jpg');
    final firebase_storage.UploadTask uploadTask = ref.putFile(File(imagePath));
    final firebase_storage.TaskSnapshot downloadUrl = (await uploadTask);
    return downloadUrl.ref.getDownloadURL();
  }

  // Méthode pour mettre à jour le champ image dans la collection Firestore
  Future<void> _updateUserImageInFirestore(String? imageUrl) async {
    if (imageUrl != null) {
      // Mettre à jour le champ image dans Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser.uid)
          .update({
        'image': imageUrl,
      });

    Navigator.pop(context);

    }
  }
  

  @override
  Widget build(BuildContext context) {
    late final User currentUser = FirebaseAuth.instance.currentUser!;

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
                          onTapArrowleft22();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "Profil"),
                    actions: [
                      AppbarImage(
                          height: getSize(24),
                          width: getSize(24),
                          svgPath: ImageConstant.imgTicket,
                          margin: getMargin(
                              left: 16, top: 29, right: 16, bottom: 26),
                          onTap: () {
                            onTapTicket();
                          })
                    ],
                    styleType: Style.bgFillWhiteA700),
                body: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 40, right: 16, bottom: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  height: getSize(150),
                                  width: getSize(150),
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        
                                        GestureDetector(
                                          onTap: () async {
                                            _pickImage();
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 150,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.grey[
                                                        200]!, // Couleur de la bordure
                                                    width:
                                                        2, // Largeur de la bordure
                                                  ),
                                                  color: Colors.grey[200],
                                                  image: _imageUrl != null
                                                      ? DecorationImage(
                                                          image: NetworkImage(
                                                              _imageUrl!),
                                                          fit: BoxFit.cover,
                                                        )
                                                      : null,
                                                ),
                                                child: _imageUrl == null
                                                    ? Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[300]!,
                                                        highlightColor:
                                                            Colors.grey[100]!,
                                                        child: Container(
                                                            height: 110,
                                                            width: 110,
                                                            //color: Colors.white,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                        .grey[
                                                                    200]!, // Couleur de la bordure
                                                                width:
                                                                    2, // Largeur de la bordure
                                                              ),
                                                            ) // Couleur du shimmer
                                                            ),
                                                      )
                                                    : null, // Pas besoin du shimmer si l'image est prête
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                  child: Icon(Icons.camera_alt),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]))),
                          SizedBox(
                            height: getVerticalSize(40),
                          ),
                          // profileDetail(ImageConstant.imgUSerIcon, "Name",
                          //     "Ronald richards"),
                          profileDetail(
                              ImageConstant.imgUSerIcon, "Pseudo", name),

                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.gray200),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          // profileDetail(ImageConstant.imgMailIcon,
                          //     "Email address", "ronaldrichard@gmail.com"),
                          profileDetail(ImageConstant.imgMailIcon,
                              "Adresse Email", email),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.gray200),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          profileDetail(ImageConstant.imgCallIcon,
                              "Numéro de téléphone", phoneNumber),

                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.gray200),
                        ])))));
  }

  onTapArrowleft22() {
    Get.back();
  }

  onTapTicket() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }

  Widget profileDetail(icon, title, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          svgPath: icon,
          height: getSize(
            24,
          ),
          width: getSize(
            24,
          ),
          margin: getMargin(
            bottom: 30,
          ),
        ),
        Expanded(
          child: Padding(
            padding: getPadding(
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtBodyGray600,
                ),
                Padding(
                  padding: getPadding(
                    top: 15,
                  ),
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBody,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
