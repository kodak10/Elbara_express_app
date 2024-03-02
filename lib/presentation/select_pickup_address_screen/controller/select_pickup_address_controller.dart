import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/select_pickup_address_screen/models/select_pickup_address_model.dart';

import '../models/listeye_item_model.dart';

/// A controller class for the SelectPickupAddressScreen.
///
/// This class manages the state of the SelectPickupAddressScreen, including the
/// current selectPickupAddressModelObj
class SelectPickupAddressController extends GetxController {
  List<ListeyeItemModel> pickuoAddressDAta =
      SelectPickupAddressModel.listeyeItemList();
  int currentAddress = 0;
  void setCurrentAddreddIndex(int index) {
    currentAddress = index;
    update();
  }
}
