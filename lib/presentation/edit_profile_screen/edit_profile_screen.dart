import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/snackbar.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'controller/edit_profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController controller = Get.put(EditProfileController());
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
      // Fetch user data from Firebase Auth
      // For example:
      // controller.nameController.text = _currentUser.displayName ?? '';
      // controller.emailController.text = _currentUser.email ?? '';

      // Fetch additional user data from Firestore
      // For example:
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser.uid)
          .get();
      if (userData.exists) {
        controller.phoneNumberController.text = userData['phoneNumber'] ?? '';
        controller.emailController.text = userData['email'] ?? '';

        controller.nameController.text = userData['displayName'] ?? '';
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
          snapshot.data()!['photoURL'] != null) {
        // Récupérer l'URL de l'image à partir du champ 'image' du document
        setState(() {
          _imageUrl = snapshot.data()!['photoURL'];
        });
      }
    }
  }

// // Méthode pour choisir une image à partir de la galerie
// Future<void> _pickImage() async {

//     _showLoadingDialog();

//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     // Enregistrer l'image dans Firebase Storage
//     final imageUrl = await _uploadImageToStorage(pickedFile.path);

//     // Mettre à jour l'URL de l'image dans Firestore
//     await _updateUserImageInFirestore(imageUrl);

//     // Mettre à jour l'URL de l'image dans l'état local
//     setState(() {
//       _imageUrl = imageUrl;
//     });
//   }
// }

  Future<void> _pickImage() async {
    // Afficher le modal de chargement
    _showLoadingDialog();

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

      // Fermer le modal de chargement
      Navigator.of(context).pop();
    } else {
      // Fermer le modal de chargement en cas d'erreur
      Navigator.of(context).pop();
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
        'photoURL': imageUrl,
      });

      // Revenir à la page précédente
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

// // Fonction pour afficher le modal de chargement
  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Empêcher la fermeture du modal en cliquant en dehors
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/loading_1.json',
                    height: 150,
                    width: 150,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> _checkEmailExists(String email) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> _checkPhoneNumberExists(String phoneNumber) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection('users')
        .where('phoneNumber', isEqualTo: '+225$phoneNumber')
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> _checkPseudoExists(String name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection('users')
        .where('name', isEqualTo: name)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> _saveProfile() async {
    String email = controller.emailController.text.trim();
    String phoneNumber = controller.phoneNumberController.text.trim();
    String name = controller.nameController.text.trim();

    bool pseudoExists = await _checkPseudoExists(name);
    bool emailExists = await _checkEmailExists(email);
    bool phoneNumberExists = await _checkPhoneNumberExists(phoneNumber);

    if (pseudoExists) {
      showCustomSnackBar(context, 'Cet Pseudo est déjà utilisé.',isError: true);
      Get.snackbar('Erreur', '');
      return;
    }

    if (emailExists) {
      showCustomSnackBar(context, 'Cet Pseudo est déjà utilisé.',isError: true);
      return;
    }

    if (phoneNumberExists) {
      showCustomSnackBar(context, 'Ce numéro de téléphone est déjà utilisé.',isError: true);
      return;
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'displayName': controller.nameController.text,
        'phoneNumber': phoneNumber,
        'email': email,
      }).then((_) {
        Navigator.pop(context);
        showCustomSnackBar(context, 'Profil mis à jour.',isError: false);

        Get.back();
      }).catchError((error) {

        print("Erreur survenue lors de la mise à jour du profil: $error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // controller.nameController.text = "ronaldrichards";
    // controller.emailController.text = "ronaldrichards@gmail.com";
    // controller.phoneNumberController.text = "(838) 484-379-7606";
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
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
                          onTapArrowleft23();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "Editer profil".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 16, top: 40, right: 16, bottom: 40),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: getVerticalSize(150),
                                  width: getHorizontalSize(150),
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
                                                          fit: BoxFit.cover)
                                                      : null,
                                                ),
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
                                      ])),
                              CustomFloatingEditText(
                                controller: controller.nameController,
                                // labelText: "lbl_name".tr,
                                // hintText: "lbl_ronaldrichards2".tr,
                                margin: getMargin(top: 48),
                                //enabled: false, // Disable editing
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    showCustomSnackBar(context,"Veuillez entrer un Pseudo",isError: true);
                                  return;
                                  }
                                  return null;
                                },
                              ),
                              CustomFloatingEditText(
                                  controller: controller.emailController,
                                  margin: getMargin(top: 16),
                                  //textInputType: TextInputType.emailAddress,
                                  //enabled: false, // désactiver le champ

                                  validator: (value) {
                                    if (value == null || (!isValidEmail(value,isRequired: true))) {
                                    showCustomSnackBar(context,"Veuillez entrer une adresse e-mail valide",isError: true);
                                  return;
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              phone_number_field(
                                  controller.phoneNumberController, (p0) {
                                if (p0 == null || p0.number.isEmpty) {
                                  showCustomSnackBar(context,"Entrez un numéro valide",isError: true);
                                  return ;
                                }
                                return null;
                              }),
                            ]))),
                bottomNavigationBar: CustomButton(
                    height: getVerticalSize(54),
                    text: "Valider".tr,
                    margin: getMargin(left: 16, right: 16, bottom: 40),
                    onTap: () {
                       FocusScope.of(context).requestFocus(FocusNode());

                      if (_formKey.currentState!.validate()) {
                        _saveProfile();
                      }
                      //onTapSave();
                    }))));
  }

  // void _saveProfile() {
  //   // Code to update user profile in Firestore
  //   // You can use Firebase Auth to get the current user
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     // Update user profile data here
  //     // For example:
  //     FirebaseFirestore.instance.collection('users').doc(user.uid).update({
  //       'displayName': controller.nameController.text,
  //       'phoneNumber': controller.phoneNumberController.text,
  //     }).then((_) {
  //           Navigator.pop(context);

  //       print('mis a jour');
  //       // Profile updated successfully
  //       Get.back();
  //     }).catchError((error) {
  //       // Handle error
  //       print("Failed to update profile: $error");
  //       // You can show an error message to the user
  //     });
  //   }
  // }

  onTapSave() {
    Get.back();
  }

  onTapArrowleft23() {
    Get.back();
  }
}
