import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/order_tracking_screen/models/order_tracking_model.dart';

import '../models/model_data.dart';

/// A controller class for the OrderTrackingScreen.
///
/// This class manages the state of the OrderTrackingScreen, including the
/// current orderTrackingModelObj
class OrderTrackingController extends GetxController {
  // Rx<OrderTrackingModel> orderTrackingModelObj = OrderTrackingModel().obs;

  List<OrderTrackingModel> orderTrakingData =
      OrderTrakingData.orderTrackingModelObj();
}
