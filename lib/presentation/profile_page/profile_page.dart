import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../log_out_screen/log_out_screen.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));

  File? _imageFile;

  @override
  void initState() {
   
    _loadImage();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }


 Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }

  
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('imagePath', pickedImage.path);
    }
  }

  Future<void> _saveImageToDevice() async {
    if (_imageFile != null) {
      final Directory appDocumentsDirectory =
          await getApplicationDocumentsDirectory();
      final String imagePath =
          '${appDocumentsDirectory.path}/mon_image.jpg';

      try {
        await _imageFile!.copy(imagePath);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('imagePath', imagePath);
        print('Image enregistrée avec succès à $imagePath');
      } catch (e) {
        print('Erreur lors de l\'enregistrement de l\'image : $e');
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
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(
                    left: 167,
                    top: 22,
                    right: 167,
                    bottom: 22,
                  ),
                  decoration: AppDecoration.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Mon Profil".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFProTextBold28,
                      ),
                    ],
                  ),
                ),
              ),
              
                                       GestureDetector(
                                            onTap: () async {
                                              //await _pickImage(ImageSource.gallery);
                                            },
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: 110,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    
                                                    color: Colors.grey[200],
                                                  ),
                                                  child: _imageFile != null
                                                      ? Image.file(
                                                          _imageFile!,
                                                          fit: BoxFit.cover,
                                                          width: double.infinity,
                                                          height: double.infinity,
                                                        )
                                                      : Icon(
                                                          Icons.person,
                                                          size: 50,
                                                          color: Colors.grey,
                                                        ),
                                                ),
                                                // Positioned(
                                                //   bottom: 0,
                                                //   right: 0,
                                                //   child: CircleAvatar(
                                                //     backgroundColor: Colors.grey[200],
                                                //     child: Icon(Icons.camera_alt),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.profileDetailsScreen);
                },
                child: Container(
                  margin: getMargin(
                    left: 16,
                    top: 40,
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
                          "Mon Compte".tr,
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
                          "Service client",
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
