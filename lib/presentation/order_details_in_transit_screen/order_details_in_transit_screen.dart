import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/cancel_order_screen/cancel_order_screen.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home_container_page/models/recently_shipped_data_model.dart';
import 'controller/order_details_in_transit_controller.dart';

// ignore: must_be_immutable
class OrderDetailsInTransitScreen extends StatefulWidget {
  OrderDetailsInTransitScreen({Key? key, required this.orderData})
      : super(key: key);
  RecentlyShipped orderData;

  @override
  State<OrderDetailsInTransitScreen> createState() =>
      _OrderDetailsInTransitScreenState();
}

class _OrderDetailsInTransitScreenState
    extends State<OrderDetailsInTransitScreen> {
  OrderDetailsInTransitController controler =
      Get.put(OrderDetailsInTransitController());

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
                          onTapArrowleft18();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_order_details".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Container(
                    padding: getPadding(top: 24, bottom: 8),
                    child: ListView(
                      padding: getPadding(left: 16, right: 16),
                      children: [
                        Padding(
                            padding: getPadding(top: 3),
                            child: Text("msg_shipping_address".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(left: 2, top: 12),
                            child: Text("msg_1901_thornridge".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        Padding(
                            padding: getPadding(top: 19),
                            child: Text("msg_delivery_address2".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(left: 2, top: 11, bottom: 16),
                            child: Text("msg_4140_parker_rd2".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray300),
                        SizedBox(
                          height: getVerticalSize(16),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: getPadding(top: 0),
                                  child: Text("lbl_package_total".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBody)),
                              Text("lbl_500_00".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtBody)
                            ]),
                        Padding(
                            padding: getPadding(top: 18, bottom: 16),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_delivery_charge".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBody),
                                  Text("lbl_50_00".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBody)
                                ])),
                        Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray300),
                        Padding(
                            padding: getPadding(top: 16),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_total".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold20),
                                  Text("lbl_550_00".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold20)
                                ])),
                        Padding(
                            padding: getPadding(top: 32),
                            child: Text("lbl_order_details".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFProTextBold20)),
                        Padding(
                            padding: getPadding(top: 22),
                            child: Text("lbl_order_number".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 12),
                            child: Text("lbl_202022176".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        Padding(
                            padding: getPadding(top: 21),
                            child: Text("lbl_delivery_type2".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 12),
                            child: Text("msg_express_delivery2".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        Padding(
                            padding: getPadding(top: 20),
                            child: Text("msg_delivery_status".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10),
                            child: Text(
                              widget.orderData.stsatus!,
                              style: widget.orderData.stsatus!.toLowerCase() ==
                                      "delivered"
                                  ? AppStyle.txtOutfitRegular16Green
                                  : widget.orderData.stsatus!.toLowerCase() ==
                                          "in transit"
                                      ? AppStyle.txtOutfitRegular16Amber
                                      : AppStyle.txtOutfitRegular16Red,
                            )
                            //
                            // Text("lbl_in_transit".tr,
                            //     overflow: TextOverflow.ellipsis,
                            //     textAlign: TextAlign.left,
                            //     style: AppStyle.txtSFProTextSemibold16)
                            ),
                        Padding(
                            padding: getPadding(top: 21),
                            child: Text("lbl_delivery_date".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBodyGray600)),
                        Padding(
                            padding: getPadding(top: 10, bottom: 0),
                            child: Text("msg_14_june_2023_at".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody))
                      ],
                    )),
                bottomNavigationBar: Padding(
                    padding: getPadding(left: 16, right: 16, bottom: 40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              height: getVerticalSize(54),
                              width: getHorizontalSize(190),
                              text: "lbl_cancel_order".tr,
                              variant: ButtonVariant.OutlineDeeppurple600,
                              fontStyle:
                                  ButtonFontStyle.SFProTextBold18Deeppurple600,
                              onTap: widget.orderData.stsatus!.toLowerCase() ==
                                          "delivered" ||
                                      widget.orderData.stsatus!.toLowerCase() ==
                                          "cancelled"
                                  ? () {
                                      Fluttertoast.showToast(
                                          msg: widget.orderData.stsatus!
                                                      .toLowerCase() ==
                                                  "delivered"
                                              ? "Your order is deliverd"
                                              : "Your order is already cancel",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  : () {
                                      onTapCancelorder();
                                    }),
                          CustomButton(
                              height: getVerticalSize(54),
                              width: getHorizontalSize(190),
                              text: "lbl_track_order".tr,
                              margin: getMargin(left: 16),
                              onTap: () {
                                onTapTrackorder();
                              })
                        ])))));
  }

  onTapCancelorder() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          content: CancelOrderScreen(),
        );
      },
    );
    // Get.toNamed(
    //  AppRoutes.cancelOrderScreen,
    // );
  }

  onTapTrackorder() {
    Get.toNamed(
      AppRoutes.trackingDetailsOneScreen,
    );
  }

  onTapArrowleft18() {
    Get.back();
  }
}
