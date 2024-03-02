import '../controller/onboarding_one_controller.dart';
import '../models/slidertrackyour_item_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SlidertrackyourItemWidget extends StatelessWidget {
  SlidertrackyourItemWidget(
    this.slidertrackyourItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SlidertrackyourItemModel slidertrackyourItemModelObj;

  var controller = Get.find<OnboardingOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: getHorizontalSize(
            318,
          ),
          margin: getMargin(
            left: 2,
            right: 22,
          ),
          child: Text(
            "msg_track_your_parcel".tr,
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
