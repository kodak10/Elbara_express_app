import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/courier_services_screen/models/courier_services_model.dart';

/// A controller class for the CourierServicesScreen.
///
/// This class manages the state of the CourierServicesScreen, including the
/// current courierServicesModelObj
class CourierServicesController extends GetxController {
  Rx<CourierServicesModel> courierServicesModelObj = CourierServicesModel().obs;
}
