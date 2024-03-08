import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../notifications_page/widgets/notifications_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notifications_item_model.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    //return Scaffold();
    return controller.notificationData.isEmpty
        ? SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                app_bar(),
                Spacer(),
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: ColorConstant.deepPurple50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.circleBorder70,
                  ),
                  child: Container(
                    height: getSize(
                      140,
                    ),
                    width: getSize(
                      140,
                    ),
                    padding: getPadding(
                      left: 30,
                      top: 29,
                      right: 30,
                      bottom: 29,
                    ),
                    decoration: AppDecoration.fillDeeppurple50.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder70,
                    ),
                    child: Stack(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgBell11,
                          height: getSize(
                            80,
                          ),
                          width: getSize(
                            80,
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 19,
                  ),
                  child: Text(
                    "Notifications".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFProTextBold22,
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    270,
                  ),
                  margin: getMargin(
                    top: 14,
                    bottom: 249,
                  ),
                  child: Text(
                    "msg_pellentesque_eu".tr,
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtBody,
                  ),
                ),
              ],
            ),
          )
        : Container(
            child: Column(
              children: [
                app_bar(),
                Expanded(
                  child: ListView(
                    children: [
                      // Container(
                      //     margin: getMargin(top: 15),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadiusStyle.roundedBorder8),
                      //     child: ListView.separated(
                      //         physics: BouncingScrollPhysics(),
                      //         shrinkWrap: true,
                      //         primary: false,
                      //         separatorBuilder: (context, index) {
                      //           return SizedBox(height: getVerticalSize(16));
                      //         },
                      //         itemCount: controller.notificationData.length,
                      //         itemBuilder: (context, index) {
                      //           NotificationsItemModel model =
                      //               controller.notificationData[index];
                      //           return NotificationsItemWidget(model);
                      //         })),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Widget app_bar() {
    return CustomAppBar(
        height: getVerticalSize(79),
        leadingWidth: 42,
        leading: AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgArrowleft,
            margin: getMargin(left: 18, top: 29, bottom: 26),
            onTap: () {
              onTapArrowleft21();
            }),
        centerTitle: true,
        title: Text("lbl_notifications".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtAvenirBlack28),
        styleType: Style.bgFillWhiteA700);
  }

  onTapArrowleft21() {
    Get.back();
  }
}
