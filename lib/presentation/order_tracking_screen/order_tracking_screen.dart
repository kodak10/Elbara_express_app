import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/order_tracking_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'models/order_tracking_model.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  OrderTrackingController controller = Get.put(OrderTrackingController());
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
                        onTapArrowleft11();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "lbl_order_tacking".tr),
                  styleType: Style.bgFillWhiteA700),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(left: 16, right: 16, bottom: 8),
                      child: Text("msg_ongoing_shipments".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFProTextBold20)),
                  Expanded(
                    child: ListView(
                      children: [
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.orderTrakingData.length,
                          itemBuilder: (context, index) {
                            OrderTrackingModel data =
                                controller.orderTrakingData[index];

                            return Padding(
                              padding: getPadding(
                                  top: 8, bottom: 8, left: 16, right: 16),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.trackingDetailsScreen);
                                },
                                child: Container(
                                  decoration: AppDecoration.fillGray50.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8),
                                  child: Padding(
                                    padding: getPadding(all: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CustomIconButton(
                                                height: getSize(64),
                                                width: getSize(64),
                                                shape: IconButtonShape
                                                    .CircleBorder32,
                                                padding: IconButtonPadding
                                                    .PaddingAll14,
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdownDeepPurple600)),
                                            SizedBox(
                                              width: getHorizontalSize(16),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(data.orderTitle!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style:
                                                        AppStyle.txtHeadline),
                                                SizedBox(
                                                  height: getVerticalSize(6),
                                                ),
                                                Text(
                                                    "Order id : ${data.orderID}"
                                                        .tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtFootnote)
                                              ],
                                            )
                                          ],
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgArrowright,
                                          height: getSize(20),
                                          width: getSize(20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  onTapArrowleft11() {
    Get.back();
  }
}
