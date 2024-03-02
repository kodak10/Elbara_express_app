import '../controller/my_address_controller.dart';
import '../models/my_address_item_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAddressItemWidget extends StatelessWidget {
  MyAddressItemWidget(
    this.myAddressItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MyAddressItemModel myAddressItemModelObj;

  var controller = Get.find<MyAddressController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 16,
        top: 15,
        right: 16,
        bottom: 15,
      ),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButton(
            height: 33,
            width: 34,
            margin: getMargin(
              bottom: 42,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgEye,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    myAddressItemModelObj.homeTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtHeadline,
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    241,
                  ),
                  margin: getMargin(
                    top: 7,
                  ),
                  child: Text(
                    "msg_4140_parker_rd".tr,
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBody,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            svgPath: ImageConstant.imgOverflowmenu,
            height: getSize(
              20,
            ),
            width: getSize(
              20,
            ),
            margin: getMargin(
              bottom: 56,
            ),
          ),
        ],
      ),
    );
  }
}
