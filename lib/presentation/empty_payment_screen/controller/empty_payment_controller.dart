import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/empty_payment_screen/models/empty_payment_model.dart';

/// A controller class for the EmptyPaymentScreen.
///
/// This class manages the state of the EmptyPaymentScreen, including the
/// current emptyPaymentModelObj
class EmptyPaymentController extends GetxController {
  Rx<EmptyPaymentModel> emptyPaymentModelObj = EmptyPaymentModel().obs;
}
