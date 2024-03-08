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

import 'controller/profile_details_controller.dart';

class ProfileDetailsScreen extends StatefulWidget {
  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
 late String email = '';
  late String name = '';
  late String phoneNumber = '';

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
          setState(() {
            email = userData['email'] ?? '';
            name = userData['displayName'] ?? '';
            phoneNumber = userData['contact'] ?? '';
          });
        }
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
                                  height: getSize(110),
                                  width: getSize(110),
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
                                            margin:
                                                getMargin(right: 1, bottom: 5),
                                            variant:
                                                IconButtonVariant.FillGray50,
                                            shape:
                                                IconButtonShape.CircleBorder14,
                                            alignment: Alignment.bottomRight,
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgGroup29Black900))
                                      ]))),
                          SizedBox(
                            height: getVerticalSize(40),
                          ),
                          // profileDetail(ImageConstant.imgUSerIcon, "Name",
                          //     "Ronald richards"),
                          profileDetail(ImageConstant.imgUSerIcon, "Pseudo",
                              name),

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
                              "Adresse Email",email),
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
                          profileDetail(
                              ImageConstant.imgCallIcon,
                              "Numéro de téléphone",
                              phoneNumber),

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
