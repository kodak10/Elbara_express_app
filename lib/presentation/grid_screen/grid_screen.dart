import 'controller/grid_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class GridScreen extends GetWidget<GridController> {
  const GridScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: getPadding(
                  bottom: 5,
                ),
                child: Text(
                  "lbl_welcome".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtProximaNovaBold34,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
