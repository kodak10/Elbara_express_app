import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

import '../home_container_page/controller/home_container_controller.dart';
import '../home_container_page/models/corier_service_model.dart';

class CalculatePriceScreen extends StatefulWidget {
  CalculatePriceScreen({Key? key}) : super(key: key);

  @override
  State<CalculatePriceScreen> createState() => _CalculatePriceScreenState();
}

class _CalculatePriceScreenState extends State<CalculatePriceScreen> {
  HomeContainerController controller = Get.put(HomeContainerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: getVerticalSize(20),
          ),
          Text(
            "lbl_prices".tr,
            style: AppStyle.txtSFProTextBold20,
          ),
          SizedBox(
            height: getVerticalSize(8),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: ColorConstant.gray300,
                    ),
                    bottom: BorderSide(
                      color: ColorConstant.gray300,
                    ))),
            child: Padding(
              padding: getPadding(all: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_bangalore".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFProTextBold20),
                      Padding(
                          padding: getPadding(top: 8),
                          child: Text("lbl_010101".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtFootnoteGray600))
                    ],
                  ),
                  CustomImageView(
                      svgPath: ImageConstant.imgArrowleftBlack900,
                      height: getSize(24),
                      width: getSize(24),
                      alignment: Alignment.center),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("lbl_chennai".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFProTextBold20),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("lbl_050505".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtFootnoteGray600))
                    ],
                  )
                ],
              ),
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: controller.courierData.length,
            itemBuilder: (context, index) {
              CourierService data = controller.courierData[index];
              return Container(
                  margin: getMargin(left: 16, top: 16, right: 16),
                  padding: getPadding(left: 16, top: 18, right: 16, bottom: 18),
                  decoration: AppDecoration.fillGray50
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                            svgPath: data.icon,
                            height: getVerticalSize(20),
                            width: getHorizontalSize(65),
                            margin: getMargin(top: 1, bottom: 1)),
                        Text(data.charges!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtHeadline)
                      ]));
            },
          )
        ],
      ),
    );
  }

  onTapPackage() {
    Get.toNamed(
      AppRoutes.calculatePriceOneScreen,
    );
  }
}
