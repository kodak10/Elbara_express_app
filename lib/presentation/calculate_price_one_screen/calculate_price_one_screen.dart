import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/calculate_price_screen/calculate_price_screen.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/calculate_price_one_controller.dart';

class CalculatePriceOneScreen extends StatefulWidget {
  const CalculatePriceOneScreen({Key? key}) : super(key: key);

  @override
  State<CalculatePriceOneScreen> createState() =>
      _CalculatePriceOneScreenState();
}

class _CalculatePriceOneScreenState extends State<CalculatePriceOneScreen> {
  CalculatePriceOneController controller =
      Get.put(CalculatePriceOneController());

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
                        onTapArrowleft10();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "lbl_shipment_price2".tr),
                  styleType: Style.bgFillWhiteA700),
              body: Container(
                child: Padding(
                  padding: getPadding(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgTimeLineIcon,
                          ),
                          SizedBox(
                            width: getHorizontalSize(16),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_pickup_from".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSubheadline),
                                    SizedBox(
                                      height: getVerticalSize(8),
                                    ),
                                    CustomTextFormField(
                                        hintText: "lbl_pickup_location".tr,
                                        suffix: Container(
                                            margin: getMargin(
                                                left: 15,
                                                top: 15,
                                                right: 15,
                                                bottom: 15),
                                            child: CustomImageView(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes
                                                      .selectPickupAddressScreen);
                                                },
                                                svgPath: ImageConstant
                                                    .imgLocationBlack900)),
                                        suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54))),
                                  ],
                                ),
                                SizedBox(
                                  height: getVerticalSize(16),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_deliver_to".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSubheadline),
                                    SizedBox(
                                      height: getVerticalSize(8),
                                    ),
                                    CustomTextFormField(
                                        hintText: "lbl_deliver_to".tr,
                                        suffix: Container(
                                            margin: getMargin(
                                                left: 15,
                                                top: 15,
                                                right: 15,
                                                bottom: 15),
                                            child: CustomImageView(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes
                                                      .selectDeliveryAddressScreen);
                                                },
                                                svgPath: ImageConstant
                                                    .imgLocationBlack900)),
                                        suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                          padding: getPadding(top: 19),
                          child: Text("lbl_weight".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSubheadline)),
                      CustomTextFormField(
                          hintText: "weight",
                          suffix: Padding(
                            padding: getPadding(top: 16, bottom: 16),
                            child: Text(
                              "Kg",
                              style: AppStyle.txtSFProDisplayRegular16,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          controller: controller.grouptwentyfourController,
                          margin: getMargin(top: 9),
                          textInputAction: TextInputAction.done,
                          // variant: TextFormFieldVariant.OutlineGray300,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 15, right: 16, bottom: 15),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgMail)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(54))),
                      CustomButton(
                          height: getVerticalSize(54),
                          text: "Calculate",
                          margin: getMargin(top: 40),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getHorizontalSize(32)),
                                      topRight: Radius.circular(
                                          getHorizontalSize(32)))),
                              builder: (context) {
                                return CalculatePriceScreen();
                              },
                            );
                          })
                    ],
                  ),
                ),
              ),
            )));
  }

  onTapCalculate() {
    Get.toNamed(
      AppRoutes.calculatePriceScreen,
    );
  }

  onTapArrowleft10() {
    Get.back();
  }
}
