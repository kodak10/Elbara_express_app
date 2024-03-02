import 'package:elbara_express/core/app_export.dart';

/// A controller class for the SelectCourierServiceScreen.
///
/// This class manages the state of the SelectCourierServiceScreen, including the
/// current selectCourierServiceModelObj
class SelectCourierServiceController extends GetxController {
  int currentServices = 0;

  void setCurrentCurierServices(int index) {
    currentServices = index;
    update();
  }
}
