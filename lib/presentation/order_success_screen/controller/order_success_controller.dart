import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/order_success_screen/models/order_success_model.dart';

/// A controller class for the OrderSuccessScreen.
///
/// This class manages the state of the OrderSuccessScreen, including the
/// current orderSuccessModelObj
class OrderSuccessController extends GetxController {
  Rx<OrderSuccessModel> orderSuccessModelObj = OrderSuccessModel().obs;
}
