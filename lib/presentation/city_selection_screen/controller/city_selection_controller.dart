import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/city_selection_screen/models/city_selection_model.dart';
import 'package:flutter/material.dart';

import '../models/model_data.dart';

/// A controller class for the CitySelectionScreen.
///
/// This class manages the state of the CitySelectionScreen, including the
/// current citySelectionModelObj
class CitySelectionController extends GetxController {
  TextEditingController searchController = TextEditingController();

  // Rx<CitySelectionModel> citySelectionModelObj = CitySelectionModel().obs;
  List<CitySelectionModel> city = ModelData.getCityes();
  int currentCity = 0;

  void setCurrentCity(int index) {
    currentCity = index;
    update();
  }
}
