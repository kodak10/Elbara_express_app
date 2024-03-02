import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/home_container_page/models/home_data.dart';

import '../models/corier_service_model.dart';
import '../models/home_slider_model.dart';
import '../models/recently_shipped_data_model.dart';

/// A controller class for the HomeContainerPage.
///
/// This class manages the state of the HomeContainerPage, including the
/// current homeContainerModelObj
class HomeContainerController extends GetxController {
  List<HomeSlider> sliderData = HomeData.getSliderData();
  List<CourierService> courierData = HomeData.getCourierData();
  List<RecentlyShipped> recentlyShipped = HomeData.getShippedData();
  Rx<int> sliderIndex = 0.obs;
}
