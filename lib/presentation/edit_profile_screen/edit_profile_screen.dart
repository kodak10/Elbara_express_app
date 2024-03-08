import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
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

import 'controller/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController controller = Get.put(EditProfileController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late User _currentUser;

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
        controller.phoneNumberController.text = userData['contact'] ?? '';
        controller.emailController.text = userData['email'] ?? '';

        controller.nameController.text = userData['displayName'] ?? '';
      }
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
                    title: AppbarSubtitle1(text: "Editer profile".tr),
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
                                  height: getVerticalSize(110),
                                  width: getHorizontalSize(113),
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgEllipse240,
                                            height: getSize(110),
                                            width: getSize(110),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(55)),
                                            alignment: Alignment.center),
                                        CustomIconButton(
                                            height: 28,
                                            width: 28,
                                            margin: getMargin(bottom: 4),
                                            variant:
                                                IconButtonVariant.FillGray50,
                                            shape:
                                                IconButtonShape.CircleBorder14,
                                            alignment: Alignment.bottomRight,
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgGroup29Black900))
                                      ])),
                              CustomFloatingEditText(
                                controller: controller.nameController,
                                // labelText: "lbl_name".tr,
                                // hintText: "lbl_ronaldrichards2".tr,
                                margin: getMargin(top: 48),
                                //enabled: false, // Disable editing
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer un Pseudo';
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
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Veuillez entrer une adresse e-mail valide";
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              phone_number_field(
                                  controller.phoneNumberController, (p0) {
                                if (p0 == null || p0.number.isEmpty) {
                                  return "Entrez un numéro valide";
                                }
                                return null;
                              }),
                            ]))),
                bottomNavigationBar: CustomButton(
                    height: getVerticalSize(54),
                    text: "Valider".tr,
                    margin: getMargin(left: 16, right: 16, bottom: 40),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _saveProfile();
                      }
                      //onTapSave();
                    }))));
  }

  void _saveProfile() {
    // Code to update user profile in Firestore
    // You can use Firebase Auth to get the current user
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Update user profile data here
      // For example:
      FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'displayName': controller.nameController.text,
        'contact': controller.phoneNumberController.text,
      }).then((_) {
        print('mis a jour');
        // Profile updated successfully
        Get.back();
      }).catchError((error) {
        // Handle error
        print("Failed to update profile: $error");
        // You can show an error message to the user
      });
    }
  }

  onTapSave() {
    Get.back();
  }

  onTapArrowleft23() {
    Get.back();
  }
}
