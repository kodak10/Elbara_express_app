import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/live_tracking_two_screen/models/live_tracking_two_model.dart';

/// A controller class for the LiveTrackingTwoScreen.
///
/// This class manages the state of the LiveTrackingTwoScreen, including the
/// current liveTrackingTwoModelObj
class LiveTrackingTwoController extends GetxController {
  Rx<LiveTrackingTwoModel> liveTrackingTwoModelObj = LiveTrackingTwoModel().obs;
}
