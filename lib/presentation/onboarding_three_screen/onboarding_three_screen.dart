import '../onboarding_three_screen/widgets/sliderbringhapp_item_widget.dart';
import 'controller/onboarding_three_controller.dart';
import 'models/sliderbringhapp_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingThreeScreen extends GetWidget<OnboardingThreeController> {
  const OnboardingThreeScreen({Key? key}) : super(key: key);

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
                      Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.customBorderBL32),
                          child: Container(
                              height: getVerticalSize(476),
                              width: double.maxFinite,
                              padding: getPadding(top: 24, bottom: 24),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderBL32,
                                  image: DecorationImage(
                                      image: fs.Svg(ImageConstant.imgGroup1100),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant
                                            .imgDeliverytracki385x428,
                                        height: getVerticalSize(385),
                                        width: getHorizontalSize(428),
                                        alignment: Alignment.bottomCenter,
                                        margin: getMargin(bottom: 2)),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgGroup38108Black900,
                                        height: getVerticalSize(274),
                                        width: getHorizontalSize(162),
                                        alignment: Alignment.topLeft,
                                        margin: getMargin(left: 16))
                                  ]))),
                      Padding(
                          padding: getPadding(left: 43, top: 43, right: 42),
                          child: Obx(() => CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: getVerticalSize(149),
                                  initialPage: 0,
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    controller.sliderIndex.value = index;
                                  }),
                              itemCount: controller.onboardingThreeModelObj
                                  .value.sliderbringhappItemList.value.length,
                              itemBuilder: (context, index, realIndex) {
                                SliderbringhappItemModel model = controller
                                    .onboardingThreeModelObj
                                    .value
                                    .sliderbringhappItemList
                                    .value[index];
                                return SliderbringhappItemWidget(model);
                              }))),
                      Obx(() => Container(
                          height: getVerticalSize(8),
                          margin: getMargin(top: 45, bottom: 5),
                          child: AnimatedSmoothIndicator(
                              activeIndex: controller.sliderIndex.value,
                              count: controller.onboardingThreeModelObj.value
                                  .sliderbringhappItemList.value.length,
                              axisDirection: Axis.horizontal,
                              effect: ScrollingDotsEffect(
                                  spacing: 8,
                                  activeDotColor: ColorConstant.deepPurple600,
                                  dotColor: ColorConstant.deepPurple50,
                                  dotHeight: getVerticalSize(8),
                                  dotWidth: getHorizontalSize(8)))))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(54),
                text: "lbl_get_started".tr,
                margin: getMargin(left: 16, right: 16, bottom: 40),
                onTap: () {
                  onTapGetstarted();
                })));
  }

  /// Navigates to the logInScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the logInScreen.
  onTapGetstarted() {
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }
}
