import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/cancel_order_one_screen/models/cancel_order_one_model.dart';

/// A controller class for the CancelOrderOneScreen.
///
/// This class manages the state of the CancelOrderOneScreen, including the
/// current cancelOrderOneModelObj
class CancelOrderOneController extends GetxController {
  Rx<CancelOrderOneModel> cancelOrderOneModelObj = CancelOrderOneModel().obs;
}
