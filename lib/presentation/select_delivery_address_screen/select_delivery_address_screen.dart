import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../select_delivery_address_screen/widgets/listeye1_item_widget.dart';
import 'controller/select_delivery_address_controller.dart';
import 'models/listeye1_item_model.dart';

class SelectDeliveryAddressScreen extends StatefulWidget {
  const SelectDeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  State<SelectDeliveryAddressScreen> createState() =>
      _SelectDeliveryAddressScreenState();
}

class _SelectDeliveryAddressScreenState
    extends State<SelectDeliveryAddressScreen> {
  SelectDeliveryAddressController selectDeliveryAddressController =
      Get.put(SelectDeliveryAddressController());

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
                          onTapArrowleft6();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "msg_delivery_address".tr),
                    styleType: Style.bgFillWhiteA700),
                body: GetBuilder<SelectDeliveryAddressController>(
                  init: SelectDeliveryAddressController(),
                  builder: (controller) => Container(
                      width: double.maxFinite,
                      padding: getPadding(all: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                onTapAddnewaddress();
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(8)),
                                    border: Border.all(
                                        color: ColorConstant.gray300)),
                                child: Padding(
                                  padding: getPadding(
                                      top: 15, bottom: 15, left: 16, right: 16),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                          svgPath:
                                              ImageConstant.imgPlusBlack900),
                                      SizedBox(
                                        width: getHorizontalSize(16),
                                      ),
                                      Text(
                                        "lbl_add_new_address".tr,
                                        style: AppStyle.txtBody,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: getPadding(top: 19),
                                child: Text("lbl_saved_address".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSFProTextBold20)),
                            Expanded(
                                child: Padding(
                                    padding: getPadding(top: 20),
                                    child: ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                              height: getVerticalSize(16));
                                        },
                                        itemCount: controller
                                            .deliveryAddressData.length,
                                        itemBuilder: (context, index) {
                                          Listeye1ItemModel model = controller
                                              .deliveryAddressData[index];
                                          return Listeye1ItemWidget(
                                              model, index, onTapAddress: () {
                                            onTapAddress();
                                          });
                                        })))
                          ])),
                ))));
  }

  onTapAddress() {
    Get.toNamed(AppRoutes.sendPackageScreen);
  }

  onTapAddnewaddress() {
    Get.toNamed(
      AppRoutes.addAddressScreen,
    );
  }

  onTapArrowleft6() {
    Get.back();
  }
}
