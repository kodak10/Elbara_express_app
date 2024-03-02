import '../controller/onboarding_two_controller.dart';
import '../models/sliderbestpacka_item_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderbestpackaItemWidget extends StatelessWidget {
  SliderbestpackaItemWidget(
    this.sliderbestpackaItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SliderbestpackaItemModel sliderbestpackaItemModelObj;

  var controller = Get.find<OnboardingTwoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: getHorizontalSize(
            310,
          ),
          margin: getMargin(
            left: 14,
            right: 18,
          ),
          child: Text(
            "msg_best_package_delivery".tr,
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
