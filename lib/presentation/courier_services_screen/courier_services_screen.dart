import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../courier_services_screen/widgets/courier_item_widget.dart';
import '../home_container_page/controller/home_container_controller.dart';
import '../home_container_page/models/corier_service_model.dart';
import 'controller/courier_services_controller.dart';

class CourierServicesScreen extends StatefulWidget {
  const CourierServicesScreen({Key? key}) : super(key: key);

  @override
  State<CourierServicesScreen> createState() => _CourierServicesScreenState();
}

class _CourierServicesScreenState extends State<CourierServicesScreen> {
  CourierServicesController courierServicesController =
      Get.put(CourierServicesController());
  HomeContainerController homeContainerController =
      Get.put(HomeContainerController());

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                backgroundColor: ColorConstant.whiteA700,
                appBar: CustomAppBar(
                    height: getVerticalSize(79),
                    leadingWidth: 42,
                    leading: AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgArrowleft,
                        margin: getMargin(left: 18, top: 29, bottom: 26),
                        onTap: () {
                          onTapArrowleft14();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "msg_courier_services2".tr),
                    styleType: Style.bgFillWhiteA700),
                body: GetBuilder<HomeContainerController>(
                  init: HomeContainerController(),
                  builder: (controller) => Container(
                      width: double.maxFinite,
                      padding: getPadding(left: 16, right: 16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(top: 16),
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: getVerticalSize(15));
                                    },
                                    itemCount: controller.courierData.length,
                                    itemBuilder: (context, index) {
                                      CourierService model =
                                          controller.courierData[index];
                                      return CourierItemWidget(model);
                                    })),
                          ])),
                ))));
  }

  onTapArrowleft14() {
    Get.back();
  }
}
