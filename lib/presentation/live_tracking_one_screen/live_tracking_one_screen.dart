import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/presentation/live_tracking_screen/live_tracking_screen.dart';
import 'package:flutter/services.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LiveTrackingOneScreen extends StatefulWidget {
  const LiveTrackingOneScreen({Key? key}) : super(key: key);

  @override
  State<LiveTrackingOneScreen> createState() => _LiveTrackingOneScreenState();
}

class _LiveTrackingOneScreenState extends State<LiveTrackingOneScreen> {
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
                extendBody: true,
                extendBodyBehindAppBar: true,
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
                          onTapArrowleft20();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_live_tracking".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Container(
                    width: size.width,
                    height: size.height,
                    padding: getPadding(top: 79),
                    decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                        image: DecorationImage(
                            image: AssetImage(ImageConstant.imgLiveTrackingBg),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: getPadding(right: 30, bottom: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return LiveTrackingScreen();
                                },
                              );
                            },
                            child: Container(
                              width: getSize(60),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(8)),
                                  color: ColorConstant.whiteA700),
                              child: Padding(
                                padding: getPadding(all: 12),
                                child: CustomImageView(
                                    svgPath:
                                        ImageConstant.trackingLocationIcon),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(16),
                          ),
                          Container(
                            width: getSize(60),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(getHorizontalSize(8)),
                                color: ColorConstant.whiteA700),
                            child: Padding(
                              padding: getPadding(top: 18, bottom: 18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgMinusIcon),
                                  SizedBox(
                                    height: getVerticalSize(9),
                                  ),
                                  Divider(
                                    color: ColorConstant.gray300,
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(9),
                                  ),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgAddIcon)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )))));
  }

  onTapArrowleft20() {
    Get.back();
  }
}
