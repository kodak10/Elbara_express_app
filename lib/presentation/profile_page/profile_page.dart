import '../log_out_screen/log_out_screen.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));
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
              CustomImageView(
                imagePath: ImageConstant.imgEllipse240,
                height: getSize(
                  110,
                ),
                width: getSize(
                  110,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    55,
                  ),
                ),
                margin: getMargin(
                  top: 40,
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
                          "Support client".tr,
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
