import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/services.dart';

import 'controller/add_card_active_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';

class AddCardActiveScreen extends StatefulWidget {
  AddCardActiveScreen({Key? key}) : super(key: key);

  @override
  State<AddCardActiveScreen> createState() => _AddCardActiveScreenState();
}

class _AddCardActiveScreenState extends State<AddCardActiveScreen> {
  AddCardActiveController controller = Get.put(AddCardActiveController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      onTapArrowleft26();
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_add_card".tr),
                styleType: Style.bgFillWhiteA700),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 14, right: 16, bottom: 14),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(left: 38, right: 38),
                            child: ExpandableText(
                              "Enter your card details. signal does not collect or store your personal information and Enter your card details.",
                              expandText: 'show more',
                              collapseText: 'show less',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(16),
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400),
                              linkStyle: TextStyle(
                                  color: ColorConstant.deepPurple600,
                                  fontSize: getFontSize(16),
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400),
                              // linkColor: ColorConstant.deepPurple600,
                            ),
                          ),
                          CustomFloatingEditText(
                              controller: controller.cardnumberController,
                              labelText: "lbl_card_number".tr,
                              hintText: "lbl_0012_2120_8741".tr,
                              margin: getMargin(top: 15),
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 16),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: CustomFloatingEditText(
                                            controller:
                                                controller.dateController,
                                            labelText: "lbl_exp_date2".tr,
                                            hintText: "lbl_06_26".tr,
                                            margin: getMargin(right: 8),
                                            variant: FloatingEditTextVariant
                                                .OutlineGray300,
                                            shape: FloatingEditTextShape
                                                .RoundedBorder8,
                                            textInputType: TextInputType.number,
                                            padding: FloatingEditTextPadding
                                                .PaddingT17)),
                                    Expanded(
                                        child: CustomFloatingEditText(
                                            controller:
                                                controller.cvvController,
                                            textInputType: TextInputType.number,
                                            labelText: "lbl_cvv".tr,
                                            hintText: "lbl_123".tr,
                                            margin: getMargin(left: 8),
                                            variant: FloatingEditTextVariant
                                                .OutlineGray300,
                                            shape: FloatingEditTextShape
                                                .RoundedBorder8,
                                            padding: FloatingEditTextPadding
                                                .PaddingT17,
                                            textInputAction:
                                                TextInputAction.done))
                                  ])),
                          CustomButton(
                              height: getVerticalSize(54),
                              text: "lbl_add_card".tr,
                              margin: getMargin(top: 30, bottom: 5),
                              onTap: () {
                                onTapAddcard();
                              })
                        ])))));
  }

  onTapAddcard() {
    Get.back();
  }

  onTapArrowleft26() {
    Get.back();
  }
}
