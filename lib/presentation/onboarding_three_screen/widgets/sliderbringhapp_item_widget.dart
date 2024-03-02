import '../controller/onboarding_three_controller.dart';
import '../models/sliderbringhapp_item_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderbringhappItemWidget extends StatelessWidget {
  SliderbringhappItemWidget(
    this.sliderbringhappItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SliderbringhappItemModel sliderbringhappItemModelObj;

  var controller = Get.find<OnboardingThreeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: getHorizontalSize(
            299,
          ),
          margin: getMargin(
            left: 18,
            right: 25,
          ),
          child: Text(
            "msg_bring_happiness".tr,
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtSFProTextBold28,
          ),
        ),
        Container(
          width: getHorizontalSize(
            343,
          ),
          margin: getMargin(
            top: 17,
          ),
          child: Text(
            "msg_a_courier_is_a_company".tr,
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtBody,
          ),
        ),
      ],
    );
  }
}
