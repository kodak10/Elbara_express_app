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
          "Suivez votre colis en temps réel, où que vous soyez.",
          "Restez connecté à votre livraison où que vous soyez, avec des mises à jour en temps réel."),
      SlidertrackyourItemModel(
          ImageConstant.imgOnboarding2nd,
          "Une livraison de colis personnalisée, juste pour vous.",
          "Recevez vos colis selon vos préférences, pour une expérience de livraison unique."),
      SlidertrackyourItemModel(
          ImageConstant.imgOnboarding3rd,
          "Propagez le bonheur avec notre service de livraison fiable et sûr.",
          "Une livraison sûre, un sourire assuré : notre engagement envers votre bonheur."),
    ];
  }
}
