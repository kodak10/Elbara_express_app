import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/city_selection_controller.dart';
import 'models/city_selection_model.dart';

class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({Key? key}) : super(key: key);

  @override
  State<CitySelectionScreen> createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  CitySelectionController citySelectionController =
      Get.put(CitySelectionController());

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
          closeApp();
          return true;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                body: Container(
                    color: ColorConstant.whiteA700,
                    child: GetBuilder<CitySelectionController>(
                      init: CitySelectionController(),
                      builder: (controller) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: double.maxFinite,
                                child: Container(
                                    decoration: AppDecoration.white,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 18),
                                              child: Text(
                                                  "lbl_city_selection".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtSFProTextBold28))
                                        ]))),
                            Expanded(
                                child: Container(
                              child: ListView(
                                padding: getPadding(left: 16, right: 16),
                                children: [
                                  CustomSearchView(
                                    controller: controller.searchController,
                                    hintText: "lbl_search_here".tr,
                                    margin: getMargin(top: 16),
                                    prefix: Container(
                                        margin: getMargin(
                                            left: 20,
                                            top: 11,
                                            right: 13,
                                            bottom: 11),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgSearch)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(46)),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(24),
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("lbl_all_cities".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtSFProDisplayBold18)),
                                  ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: controller.city.length,
                                    itemBuilder: (context, index) {
                                      CitySelectionModel data =
                                          controller.city[index];
                                      return GestureDetector(
                                        onTap: () {
                                          PrefUtils.setIsSignIn(false);
                                          controller.setCurrentCity(index);
                                          Get.toNamed(
                                            AppRoutes.homeContainer1Screen,
                                          );
                                        },
                                        child: Container(
                                            width: getHorizontalSize(396),
                                            margin: getMargin(top: 6),
                                            padding:
                                                getPadding(top: 12, bottom: 12),
                                            decoration:
                                                AppDecoration.txtOutlineGray200,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(data.cityName!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtSFProDisplayRegular16),
                                                controller.currentCity == index
                                                    ? CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgTickIcon,
                                                      )
                                                    : SizedBox()
                                              ],
                                            )),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ))
                          ]),
                    )))));
  }
}
