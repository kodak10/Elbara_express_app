import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/privacy_policy_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  PrivacyPolicyController controller = Get.put(PrivacyPolicyController());
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
                          onTapArrowleft33();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_privacy_policy".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 17, top: 25, right: 17, bottom: 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("msg_1_types_of_data".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSFProDisplayBold18),
                          Container(
                              width: getHorizontalSize(390),
                              margin: getMargin(top: 5),
                              child: Text("msg_duis_tristique_diam".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProDisplayRegular16)),
                          Padding(
                              padding: getPadding(top: 21),
                              child: Text("msg_2_use_of_your_personal".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProDisplayBold20)),
                          Container(
                              width: getHorizontalSize(377),
                              margin: getMargin(top: 13, right: 16),
                              child: Text("msg_sed_sollicitudin".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProDisplayRegular16)),
                          Padding(
                              padding: getPadding(top: 42),
                              child: Text("msg_3_disclosure_of".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProDisplayBold20)),
                          Container(
                              width: getHorizontalSize(383),
                              margin: getMargin(top: 13, right: 10, bottom: 5),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_sed_sollicitudin3".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'SF Pro Display',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "msg_maecenas_egestas".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'SF Pro Display',
                                            fontWeight: FontWeight.w400))
                                  ]),
                                  textAlign: TextAlign.left))
                        ])))));
  }

  onTapArrowleft33() {
    Get.back();
  }
}
