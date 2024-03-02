import 'controller/splash_one_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SplashOneScreen extends GetWidget<SplashOneController> {
  const SplashOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.deepPurple600,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgCar,
                height: getVerticalSize(
                  66,
                ),
                width: getHorizontalSize(
                  100,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 17,
                  bottom: 5,
                ),
                child: Text(
                  "Elbara Express".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFProTextBold30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
