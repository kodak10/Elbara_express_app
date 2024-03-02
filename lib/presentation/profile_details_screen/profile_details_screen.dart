import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/profile_details_controller.dart';

class ProfileDetailsScreen extends StatefulWidget {
  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  ProfileDetailsController controlelr = Get.put(ProfileDetailsController());

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
                          onTapArrowleft22();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_profile".tr),
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
                          profileDetail(ImageConstant.imgUSerIcon, "Name",
                              "Ronald richards"),
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
                          profileDetail(ImageConstant.imgMailIcon,
                              "Email address", "ronaldrichard@gmail.com"),
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
                              "Phone Number", "(405) 555-0128"),
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
