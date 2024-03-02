import 'controller/live_tracking_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

class LiveTrackingScreen extends GetWidget<LiveTrackingController> {
  const LiveTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 16, right: 16, top: 0, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getSize(15),
          ),
          Center(
            child: Container(
              height: getSize(5),
              width: getSize(70),
              decoration: BoxDecoration(
                  color: ColorConstant.gray300,
                  borderRadius: BorderRadius.circular(getHorizontalSize(100))),
            ),
          ),
          SizedBox(
            height: getSize(20),
          ),
          Text("msg_package_information".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFProTextBold20),
          Container(
              margin: getMargin(top: 18),
              padding: getPadding(all: 16),
              decoration: AppDecoration.fillGray50
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: getHorizontalSize(146),
                        margin: getMargin(top: 1),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "lbl_delivery_type".tr,
                                  style: TextStyle(
                                      color: ColorConstant.gray600,
                                      fontSize: getFontSize(16),
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: " \n".tr,
                                  style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(16),
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "msg_express_delivery".tr,
                                  style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(18),
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w600))
                            ]),
                            textAlign: TextAlign.left)),
                    Container(
                        width: getHorizontalSize(99),
                        margin: getMargin(top: 1),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "lbl_status".tr,
                                  style: TextStyle(
                                      color: ColorConstant.gray600,
                                      fontSize: getFontSize(16),
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: " \n".tr,
                                  style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(16),
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "lbl_on_the_way".tr,
                                  style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(18),
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w600))
                            ]),
                            textAlign: TextAlign.left)),
                  ])),
          SizedBox(
            height: getVerticalSize(16),
          )
        ],
      ),
    );
  }

  onTapArrowleft17() {
    Get.back();
  }
}
