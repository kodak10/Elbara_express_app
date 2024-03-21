import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/home_container_page/models/recently_shipped_data_model.dart';

import 'corier_service_model.dart';
import 'home_slider_model.dart';

class HomeData {
  static List<HomeSlider> getSliderData() {
    return [
      HomeSlider(ImageConstant.imgSlider1st,
          "Phrase 01"),
      HomeSlider(ImageConstant.imgSlider2nd,
          "Phrase 02"),
      HomeSlider(ImageConstant.imgSlider3rd,
          "Phrase 03"),
    ];
  }

  static List<CourierService> getCourierData() {
    return [
      CourierService(
          ImageConstant.imgcourier1st,
          "Our New Customer Center guides you through all the ",
          "5.0",
          "Wed, 22 Jun ‘23",
          "\$500",
          "Becoming the first to know about Our service and new product updates, regulatory updates, service disruption notification and more!"),
      CourierService(
          ImageConstant.imgcourier2nd,
          "Our New Customer Center guides you through all the ",
          "5.0",
          "Wed, 23 Jun ‘23",
          "\$450",
          "Becoming the first to know about Our service and new product updates, regulatory updates, service disruption notification and more!"),
      CourierService(
          ImageConstant.imgcourier3rd,
          "Our New Customer Center guides you through all the ",
          "5.0",
          "Wed, 22 Jun ‘23",
          "\$350",
          "Becoming the first to know about Our service and new product updates, regulatory updates, service disruption notification and more!"),
      CourierService(
          ImageConstant.imgcourier4th,
          "Our New Customer Center guides you through all the ",
          "5.0",
          "Wed, 23 Jun ‘23",
          "\$480",
          "Becoming the first to know about Our service and new product updates, regulatory updates, service disruption notification and more!"),
    ];
  }

  static List<RecentlyShipped> getShippedData() {
    return [
      RecentlyShipped("Aarav", "#202022194", "Sat, 18 Jun 23", "Delivered"),
      RecentlyShipped("Pranav", "#202022194", "Sat, 18 Jun 23", "In Transit"),
      RecentlyShipped("Ronald", "#202022194", "Sat, 18 Jun 23", "Cancelled"),
      RecentlyShipped("Estard", "#202022194", "Sat, 18 Jun 23", "Delivered"),
      RecentlyShipped("Pranav", "#202022194", "Sat, 18 Jun 23", "In Transit"),
    ];
  }
}
