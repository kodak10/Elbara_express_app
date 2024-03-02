import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/tracking_details_one_screen/models/tracking_details_one_model.dart';

/// A controller class for the TrackingDetailsOneScreen.
///
/// This class manages the state of the TrackingDetailsOneScreen, including the
/// current trackingDetailsOneModelObj
class TrackingDetailsOneController extends GetxController {
  Rx<TrackingDetailsOneModel> trackingDetailsOneModelObj =
      TrackingDetailsOneModel().obs;
}
