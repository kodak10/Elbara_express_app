import '../controller/recently_shipped_controller.dart';
import '../models/recently_item_model.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecentlyItemWidget extends StatelessWidget {
  RecentlyItemWidget(
    this.recentlyItemModelObj, {
    Key? key,
    this.onTapTrackpackage,
  }) : super(
          key: key,
        );

  RecentlyItemModel recentlyItemModelObj;

  var controller = Get.find<RecentlyShippedController>();

  VoidCallback? onTapTrackpackage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 16,
          top: 15,
          right: 16,
          bottom: 15,
        ),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconButton(
                  height: 42,
                  width: 42,
                  margin: getMargin(
                    bottom: 2,
                  ),
                  shape: IconButtonShape.RoundedBorder8,
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdownDeepPurple600,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 8,
                    top: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_shipped_to".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSubheadlineGray600,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 4,
                        ),
                        child: Obx(
                          () => Text(
                            recentlyItemModelObj.shippedtovalueTxt.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSubheadline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: getPadding(
                top: 16,
              ),
              child: Text(
                "msg_order_id_202022194".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtSFProTextRegular14,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 23,
              ),
              child: Text(
                "msg_order_date_sat".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtFootnote,
              ),
            ),
            CustomButton(
              height: getVerticalSize(
                40,
              ),
              text: "lbl_track_package".tr,
              margin: getMargin(
                top: 16,
                bottom: 1,
              ),
              padding: ButtonPadding.PaddingAll11,
              fontStyle: ButtonFontStyle.SFProTextBold15WhiteA700,
              onTap: () {
                onTapTrackpackage?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
