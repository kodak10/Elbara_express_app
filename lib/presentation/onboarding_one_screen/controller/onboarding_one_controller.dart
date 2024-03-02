import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/onboarding_one_screen/models/onboarding_one_model.dart';

import '../models/slidertrackyour_item_model.dart';

/// A controller class for the OnboardingOneScreen.
///
/// This class manages the state of the OnboardingOneScreen, including the
/// current onboardingOneModelObj
class OnboardingOneController extends GetxController {
  Rx<OnboardingOneModel> onboardingOneModelObj = OnboardingOneModel().obs;
  List<SlidertrackyourItemModel> onboardingData =
      OnboardingOneModel.slidertrackyourItemList();

  Rx<int> sliderIndex = 0.obs;
  int currentPage = 0;

  void setCurrentPage(int value) {
    currentPage = value;
    update();
  }
}
