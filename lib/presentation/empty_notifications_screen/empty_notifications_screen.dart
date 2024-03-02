import 'controller/empty_notifications_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/home_container_page/home_container_page.dart';
import 'package:elbara_express/presentation/my_orders_page/my_orders_page.dart';
import 'package:elbara_express/presentation/profile_page/profile_page.dart';
import 'package:elbara_express/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class EmptyNotificationsScreen extends GetWidget<EmptyNotificationsController> {
  const EmptyNotificationsScreen({Key? key})
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(
                    left: 122,
                    top: 22,
                    right: 122,
                    bottom: 22,
                  ),
                  decoration: AppDecoration.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_notifications".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFProTextBold28,
                      ),
                    ],
                  ),
                ),
              ),
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
                  "msg_no_notification".tr,
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
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type), id: 1);
          },
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeContainerPage;
      case BottomBarEnum.Order:
        return AppRoutes.myOrdersPage;
      case BottomBarEnum.Notification:
        return "/";
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeContainerPage:
        return HomeContainerPage();
      case AppRoutes.myOrdersPage:
        return MyOrdersPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
