import '../onboarding_two_screen/widgets/sliderbestpacka_item_widget.dart';
import 'controller/onboarding_two_controller.dart';
import 'models/sliderbestpacka_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingTwoScreen extends GetWidget<OnboardingTwoController> {
  const OnboardingTwoScreen({Key? key}) : super(key: key);

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
                              padding: getPadding(top: 7, bottom: 7),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderBL32,
                                  image: DecorationImage(
                                      image: fs.Svg(ImageConstant.imgGroup1102),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant
                                            .imgDeliverytracki353x428,
                                        height: getVerticalSize(353),
                                        width: getHorizontalSize(428),
                                        alignment: Alignment.bottomCenter,
                                        margin: getMargin(bottom: 34)),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgVector9,
                                        height: getVerticalSize(210),
                                        width: getHorizontalSize(177),
                                        alignment: Alignment.topLeft,
                                        margin: getMargin(left: 55, top: 46)),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgDownload,
                                        height: getVerticalSize(54),
                                        width: getHorizontalSize(61),
                                        alignment: Alignment.topLeft,
                                        margin: getMargin(left: 7))
                                  ]))),
                      Padding(
                          padding: getPadding(left: 44, top: 43, right: 41),
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
                              itemCount: controller.onboardingTwoModelObj.value
                                  .sliderbestpackaItemList.value.length,
                              itemBuilder: (context, index, realIndex) {
                                SliderbestpackaItemModel model = controller
                                    .onboardingTwoModelObj
                                    .value
                                    .sliderbestpackaItemList
                                    .value[index];
                                return SliderbestpackaItemWidget(model);
                              }))),
                      Obx(() => Container(
                          height: getVerticalSize(8),
                          margin: getMargin(top: 45),
                          child: AnimatedSmoothIndicator(
                              activeIndex: controller.sliderIndex.value,
                              count: controller.onboardingTwoModelObj.value
                                  .sliderbestpackaItemList.value.length,
                              axisDirection: Axis.horizontal,
                              effect: ScrollingDotsEffect(
                                  spacing: 8,
                                  activeDotColor: ColorConstant.deepPurple600,
                                  dotColor: ColorConstant.deepPurple50,
                                  dotHeight: getVerticalSize(8),
                                  dotWidth: getHorizontalSize(8))))),
                      CustomButton(
                          height: getVerticalSize(54),
                          text: "lbl_next".tr,
                          margin: getMargin(left: 16, top: 24, right: 16),
                          onTap: () {
                            onTapNext();
                          }),
                      GestureDetector(
                          onTap: () {
                            onTapTxtSkip();
                          },
                          child: Padding(
                              padding: getPadding(top: 19, bottom: 5),
                              child: Text("lbl_skip".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSubheadline)))
                    ]))));
  }

  /// Navigates to the onboardingThreeScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the onboardingThreeScreen.
  onTapNext() {
    Get.toNamed(
      AppRoutes.onboardingThreeScreen,
    );
  }

  /// Navigates to the onboardingThreeScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the onboardingThreeScreen.
  onTapTxtSkip() {
    Get.toNamed(
      AppRoutes.onboardingThreeScreen,
    );
  }
}
