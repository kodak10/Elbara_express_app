import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../payment_method_screen/controller/payment_method_controller.dart';
import '../payment_method_screen/models/payment_method_model.dart';

class PaymentMethodOneScreen extends StatefulWidget {
  const PaymentMethodOneScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodOneScreen> createState() => _PaymentMethodOneScreenState();
}

class _PaymentMethodOneScreenState extends State<PaymentMethodOneScreen> {
  PaymentMethodController controller = Get.put(PaymentMethodController());

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
                resizeToAvoidBottomInset: false,
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
                          onTapArrowleft27();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_my_cards".tr),
                    styleType: Style.bgFillWhiteA700),
                body: Container(
                    width: double.maxFinite,
                    padding: getPadding(left: 0, top: 21, right: 0, bottom: 21),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(left: 16, right: 16),
                              child: Text("lbl_my_cards".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProTextBold20)),
                          ListView.builder(
                            padding: getPadding(left: 16, right: 16, top: 8),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: controller.paymentMethods.length,
                            itemBuilder: (context, index) {
                              PaymentMethodModel data =
                                  controller.paymentMethods[index];
                              return Padding(
                                padding: getPadding(top: 8, bottom: 8),
                                child: Container(
                                  decoration: AppDecoration.fillGray50.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16,
                                    color: ColorConstant.gray50,
                                  ),
                                  child: Padding(
                                    padding: getPadding(
                                        top: 20,
                                        bottom: 20,
                                        left: 16,
                                        right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CustomImageView(
                                                svgPath: data.icon,
                                                height: getSize(36),
                                                width: getSize(36),
                                                alignment: Alignment.center),
                                            SizedBox(
                                              width: getHorizontalSize(12),
                                            ),
                                            Text(data.title!,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline)
                                          ],
                                        ),

                                        //ImageConstant.imgIcRadioButton,
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ])),
                bottomNavigationBar: CustomButton(
                    height: getVerticalSize(54),
                    text: "lbl_add_card".tr,
                    margin: getMargin(left: 16, right: 16, bottom: 40),
                    onTap: () {
                      onTapAddcard();
                    }))));
  }

  onTapAddcard() {
    Get.toNamed(
      AppRoutes.addCardActiveScreen,
    );
  }

  onTapArrowleft27() {
    Get.back();
  }
}
