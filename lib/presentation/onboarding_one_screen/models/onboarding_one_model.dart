import 'package:elbara_express/core/app_export.dart';

import 'slidertrackyour_item_model.dart';

/// This class defines the variables used in the [onboarding_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingOneModel {
  // Rx<List<SlidertrackyourItemModel>> slidertrackyourItemList =
  //     Rx(List.generate(1, (index) => SlidertrackyourItemModel()));

  static List<SlidertrackyourItemModel> slidertrackyourItemList() {
    return [
      SlidertrackyourItemModel(
          ImageConstant.imgOnboarding1st,
          "Suivez votre colis où que vous soyez",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut"),
      SlidertrackyourItemModel(
          ImageConstant.imgOnboarding2nd,
          "La meilleure livraison de colis rien que pour vous",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut"),
      SlidertrackyourItemModel(
          ImageConstant.imgOnboarding3rd,
          "Apportez du bonheur avec la livraison la plus sur",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut"),
    ];
  }
}
