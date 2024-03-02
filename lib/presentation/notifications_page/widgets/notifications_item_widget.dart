import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

import '../controller/notifications_controller.dart';
import '../models/notifications_item_model.dart';

// ignore: must_be_immutable
class NotificationsItemWidget extends StatelessWidget {
  NotificationsItemWidget(
    this.notificationsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationsItemModel notificationsItemModelObj;

  NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: getPadding(
        left: 16,
        top: 15,
        right: 16,
        bottom: 15,
      ),
      decoration: AppDecoration.outlineGray200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorConstant.deepPurple50),
                child: Padding(
                  padding: getPadding(all: 8),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgUserDeepPurple600,
                  ),
                ),
              ),
              SizedBox(
                width: getHorizontalSize(16),
              ),
              Container(
                width: getSize(280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notificationsItemModelObj.title!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtHeadline,
                    ),
                    Padding(
                      padding: getPadding(
                        top: 9,
                      ),
                      child: Text(
                        notificationsItemModelObj.subTitle!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtFootnote,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: getPadding(
              top: 3,
              bottom: 29,
            ),
            child: Text(
              notificationsItemModelObj.time!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOutfitRegular14.copyWith(
                letterSpacing: getHorizontalSize(
                  0.14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
