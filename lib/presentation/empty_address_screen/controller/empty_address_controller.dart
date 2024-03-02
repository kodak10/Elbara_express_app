import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/empty_address_screen/models/empty_address_model.dart';

/// A controller class for the EmptyAddressScreen.
///
/// This class manages the state of the EmptyAddressScreen, including the
/// current emptyAddressModelObj
class EmptyAddressController extends GetxController {
  Rx<EmptyAddressModel> emptyAddressModelObj = EmptyAddressModel().obs;
}
