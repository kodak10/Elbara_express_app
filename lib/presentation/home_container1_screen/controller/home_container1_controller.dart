import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/home_container1_screen/models/home_container1_model.dart';

/// A controller class for the HomeContainer1Screen.
///
/// This class manages the state of the HomeContainer1Screen, including the
/// current homeContainer1ModelObj
class HomeContainer1Controller extends GetxController {
  Rx<HomeContainer1Model> homeContainer1ModelObj = HomeContainer1Model().obs;
}
