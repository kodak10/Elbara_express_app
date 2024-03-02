import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/empty_my_orders_screen/models/empty_my_orders_model.dart';

/// A controller class for the EmptyMyOrdersScreen.
///
/// This class manages the state of the EmptyMyOrdersScreen, including the
/// current emptyMyOrdersModelObj
class EmptyMyOrdersController extends GetxController {
  Rx<EmptyMyOrdersModel> emptyMyOrdersModelObj = EmptyMyOrdersModel().obs;
}
