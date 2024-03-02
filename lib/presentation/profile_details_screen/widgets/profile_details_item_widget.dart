import '../controller/profile_details_controller.dart';
import '../models/profile_details_item_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileDetailsItemWidget extends StatelessWidget {
  ProfileDetailsItemWidget(
    this.profileDetailsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfileDetailsItemModel profileDetailsItemModelObj;

  var controller = Get.find<ProfileDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          svgPath: ImageConstant.imgUser,
          height: getSize(
            24,
          ),
          width: getSize(
            24,
          ),
          margin: getMargin(
            bottom: 30,
          ),
        ),
        Expanded(
          child: Padding(
            padding: getPadding(
              left: 16,
              top: 1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    profileDetailsItemModelObj.nameTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBodyGray600,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 12,
                  ),
                  child: Obx(
                    () => Text(
                      profileDetailsItemModelObj.namevalueTxt.value,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtBody,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
