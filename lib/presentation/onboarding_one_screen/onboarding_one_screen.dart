import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/onboarding_one_controller.dart';
import 'models/slidertrackyour_item_model.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({super.key});

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  OnboardingOneController onboardingOneController =
      Get.put(OnboardingOneController());
  PageController pageController = PageController();

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
              body: GetBuilder<OnboardingOneController>(
                init: OnboardingOneController(),
                builder: (controller) => Stack(
                  children: [
                    PageView.builder(
                      onPageChanged: (value) {
                        controller.setCurrentPage(value);
                      },
                      itemCount: controller.onboardingData.length,
                      controller: pageController,
                      itemBuilder: (context, index) {
                        SlidertrackyourItemModel data =
                            controller.onboardingData[index];
                        return Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(data.image!),
                                fit: BoxFit.fill),
                          ),
                          child: Padding(
                            padding: getPadding(bottom: 210),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: getSize(382),
                                  child: Text(
                                    data.title!,
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.txtSFProTextBold28,
                                  ),
                                ),
                                SizedBox(
                                  height: getVerticalSize(16),
                                ),
                                Padding(
                                  padding: getPadding(left: 40, right: 40),
                                  child: Text(
                                    data.subTitle!,
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.txtBody,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: getPadding(bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  controller.onboardingData.length, (index) {
                                return AnimatedContainer(
                                  margin: getMargin(left: 4, right: 4),
                                  duration: const Duration(milliseconds: 300),
                                  height: getSize(8),
                                  width: getSize(8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (index == controller.currentPage)
                                          ? ColorConstant.deepPurple600
                                          : ColorConstant.deepPurple50),
                                );
                              })),
                          CustomButton(
                              height: getVerticalSize(54),
                              text: controller.currentPage ==
                                      controller.onboardingData.length - 1
                                  ? "Demarrer"
                                  : "Suivant".tr,
                              margin: getMargin(
                                  left: 20,
                                  top: controller.currentPage ==
                                          controller.onboardingData.length - 1
                                      ? 66
                                      : 24,
                                  right: 20),
                              onTap: controller.currentPage ==
                                      controller.onboardingData.length - 1
                                  ? () {
                                      PrefUtils.setIsIntro(false);
                                      Get.toNamed(
                                        AppRoutes.logInScreen,
                                      );
                                    }
                                  : () {
                                      pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.bounceIn);
                                    }),
                          controller.currentPage ==
                                  controller.onboardingData.length - 1
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    onTapTxtSkip();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 16, bottom: 5),
                                      child: Text("Passer".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtSubheadline)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  onTapNext() {
    PrefUtils.setIsIntro(false);
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }

  onTapTxtSkip() {
    PrefUtils.setIsIntro(false);
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }
}
