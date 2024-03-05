import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/order_success_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  OrderSuccessController orderSuccessController =
      Get.put(OrderSuccessController());
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
          Get.offAllNamed(AppRoutes.homeContainer1Screen);
          return true;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                backgroundColor: ColorConstant.whiteA700,
                body: Container(
                    width: double.maxFinite,
                    padding: getPadding(left: 35, right: 35),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              color: ColorConstant.deepPurple50,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder70),
                              child: Container(
                                  height: getSize(140),
                                  width: getSize(140),
                                  padding: getPadding(all: 30),
                                  decoration: AppDecoration.fillDeeppurple50
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder70),
                                  child: Stack(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant
                                            .imgCheckmarkDeepPurple600,
                                        height: getSize(80),
                                        width: getSize(80),
                                        alignment: Alignment.center)
                                  ]))),
                          Padding(
                              padding: getPadding(top: 21),
                              child: Text("msg_your_package_book".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: AppStyle.txtSFProTextBold22)),
                          Container(
                              width: getHorizontalSize(347),
                              margin: getMargin(left: 18, top: 12, right: 23),
                              child: Text("msg_you_have_successfully2".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtBody)),
                          CustomButton(
                              height: getVerticalSize(53),
                              width: getHorizontalSize(164),
                              text: "Page d'Accueil".tr,
                              margin: getMargin(top: 38, bottom: 5),
                              onTap: () {
                                onTapGotohome();
                              })
                        ])))));
  }

  onTapGotohome() {
    Get.offAllNamed(AppRoutes.homeContainer1Screen);
  }
}
